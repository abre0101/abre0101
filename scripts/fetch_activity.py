import requests
import json

def fetch_recent_activities(token, username, language, translations, limit=15):
    """Fetch recent GitHub activities for a user"""
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    
    url = f'https://api.github.com/users/{username}/events/public'
    response = requests.get(url, headers=headers)
    
    if response.status_code != 200:
        print(f"Error fetching activities: {response.status_code}")
        return []
    
    events = response.json()[:limit]
    activities = []
    
    for event in events:
        repo_name = event['repo']['name']
        repo_url = f"https://github.com/{repo_name}"
        event_type = event['type']
        payload = event.get('payload', {})
        
        activity = None
        
        if event_type == "PullRequestEvent":
            pr = payload.get('pull_request', {})
            pr_url = pr.get('html_url', '')
            pr_number = pr.get('number', '')
            
            if pr.get('merged'):
                action = 'merged_pr'
            elif payload.get('action') == 'closed':
                action = 'closed_pr'
            else:
                action = 'opened_pr'
            
            activity = translations[language][action].replace(
                '%{number}', f"[#{pr_number}]({pr_url})"
            ).replace('%{repo_name}', repo_name).replace('%{url}', pr_url)
        
        elif event_type == "IssuesEvent":
            issue = payload.get('issue', {})
            issue_url = issue.get('html_url', '')
            issue_number = issue.get('number', '')
            action_map = {
                'opened': 'opened_issue',
                'closed': 'closed_issue',
                'reopened': 'reopened_issue'
            }
            action = action_map.get(payload.get('action'))
            
            if action:
                activity = translations[language][action].replace(
                    '%{number}', f"[#{issue_number}]({issue_url})"
                ).replace('%{repo_name}', repo_name).replace('%{url}', issue_url)
        
        elif event_type == "IssueCommentEvent":
            issue = payload.get('issue', {})
            comment_url = payload.get('comment', {}).get('html_url', '')
            issue_number = issue.get('number', '')
            
            activity = translations[language]['commented'].replace(
                '%{number}', f"[#{issue_number}]({comment_url})"
            ).replace('%{repo_name}', repo_name).replace('%{url}', comment_url)
        
        elif event_type == "PushEvent":
            commits = payload.get('commits', [])
            commit_url = f"{repo_url}/commits"
            
            activity = translations[language]['pushed'].replace(
                '%{commits}', f"[{len(commits)} commit(s)]({commit_url})"
            ).replace('%{repo_name}', repo_name).replace('%{url}', repo_url)
        
        elif event_type == "CreateEvent":
            if payload.get('ref_type') == 'repository':
                activity = translations[language]['created_repo'].replace(
                    '%{repo_name}', repo_name
                ).replace('%{url}', repo_url)
        
        elif event_type == "ForkEvent":
            forkee = payload.get('forkee', {})
            forked_name = forkee.get('full_name', '')
            forked_url = f"https://github.com/{forked_name}"
            
            activity = translations[language]['forked'].replace(
                '%{forked_repo}', forked_name
            ).replace('%{forked_url}', forked_url).replace(
                '%{repo_name}', repo_name
            ).replace('%{url}', repo_url)
        
        elif event_type == "WatchEvent":
            if payload.get('action') == 'started':
                activity = translations[language]['starred'].replace(
                    '%{repo_name}', repo_name
                ).replace('%{url}', repo_url)
        
        elif event_type == "MemberEvent":
            if payload.get('action') == 'added':
                activity = translations[language]['became_collaborator'].replace(
                    '%{repo_name}', repo_name
                ).replace('%{url}', repo_url)
        
        elif event_type == "PullRequestReviewEvent":
            pr = payload.get('pull_request', {})
            pr_url = pr.get('html_url', '')
            pr_number = pr.get('number', '')
            
            activity = translations[language]['reviewed_pr'].replace(
                '%{number}', f"[#{pr_number}]({pr_url})"
            ).replace('%{repo_name}', repo_name).replace('%{url}', pr_url)
        
        if activity:
            activities.append(activity)
    
    return activities
