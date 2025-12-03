import os
import requests
from datetime import datetime

# GitHub API configuration
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN', '')
USERNAME = os.getenv('GITHUB_USERNAME', 'abre0101')
HEADERS = {'Authorization': f'token {GITHUB_TOKEN}'} if GITHUB_TOKEN else {}

def fetch_recent_activity():
    """Fetch recent GitHub activity"""
    url = f'https://api.github.com/users/{USERNAME}/events/public'
    response = requests.get(url, headers=HEADERS)
    
    if response.status_code != 200:
        return ['🔄 Activity will be automatically updated here']
    
    events = response.json()[:10]
    activities = []
    
    for event in events:
        repo_name = event['repo']['name']
        repo_url = f"https://github.com/{repo_name}"
        event_type = event['type']
        
        if event_type == 'PushEvent':
            commits = len(event['payload']['commits'])
            activities.append(f"⬆️ Pushed {commits} commit(s) to [{repo_name}]({repo_url})")
        elif event_type == 'PullRequestEvent':
            action = event['payload']['action']
            pr_number = event['payload']['pull_request']['number']
            if action == 'opened':
                activities.append(f"😎 Opened PR [#{pr_number}]({repo_url}/pull/{pr_number}) in [{repo_name}]({repo_url})")
            elif action == 'closed':
                activities.append(f"❌ Closed PR [#{pr_number}]({repo_url}/pull/{pr_number}) in [{repo_name}]({repo_url})")
        elif event_type == 'IssuesEvent':
            action = event['payload']['action']
            issue_number = event['payload']['issue']['number']
            if action == 'opened':
                activities.append(f"⚠️ Opened issue [#{issue_number}]({repo_url}/issues/{issue_number}) in [{repo_name}]({repo_url})")
            elif action == 'closed':
                activities.append(f"🔑 Closed issue [#{issue_number}]({repo_url}/issues/{issue_number}) in [{repo_name}]({repo_url})")
        elif event_type == 'WatchEvent':
            activities.append(f"⭐ Starred [{repo_name}]({repo_url})")
        elif event_type == 'ForkEvent':
            activities.append(f"🔱 Forked [{repo_name}]({repo_url})")
        elif event_type == 'CreateEvent':
            activities.append(f"🆕 Created new repository [{repo_name}]({repo_url})")
    
    return activities if activities else ['🔄 Activity will be automatically updated here']

def fetch_top_repositories():
    """Fetch top repositories by stars"""
    url = f'https://api.github.com/users/{USERNAME}/repos'
    response = requests.get(url, headers=HEADERS, params={'sort': 'stars', 'per_page': 5})
    
    if response.status_code != 200:
        return []
    
    repos = response.json()
    repo_list = []
    
    for repo in repos:
        name = repo['name']
        stars = repo['stargazers_count']
        forks = repo['forks_count']
        url = repo['html_url']
        repo_list.append(f"| [{name}]({url}) | {stars} | {forks} |")
    
    return repo_list

def fetch_top_followers():
    """Fetch top followers"""
    url = f'https://api.github.com/users/{USERNAME}/followers'
    response = requests.get(url, headers=HEADERS, params={'per_page': 14})
    
    if response.status_code != 200:
        return '<table>\n  <tr>\n    <td align="center">Followers will be automatically updated here</td>\n  </tr>\n</table>'
    
    followers = response.json()
    
    # Create table with 7 columns
    table = '<table>\n'
    for i in range(0, len(followers), 7):
        table += '  <tr>'
        for follower in followers[i:i+7]:
            login = follower['login']
            avatar = follower['avatar_url']
            profile = follower['html_url']
            table += f'<td align="center">\n  <a href="{profile}">\n    <img src="{avatar}" width="75px" alt="{login}" />\n    <br />\n    <sub>{login}</sub>\n  </a>\n</td>\n'
        table += '</tr>\n'
    table += '</table>'
    
    return table

def update_readme():
    """Update README.md with latest data"""
    readme_path = os.path.join(os.path.dirname(__file__), '..', 'README.md')
    
    with open(readme_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Fetch data
    activities = fetch_recent_activity()
    repos = fetch_top_repositories()
    followers = fetch_top_followers()
    
    # Update activity section
    activity_table = '| Recent Activity |\n| --- |\n' + '\n'.join(activities)
    content = content.split('<!--START_SECTION:activity-->')[0] + \
              f'<!--START_SECTION:activity-->\n{activity_table}\n<!--END_SECTION:activity-->' + \
              content.split('<!--END_SECTION:activity-->')[1]
    
    # Update repos section
    if repos:
        repos_table = '| 📁 Repository | ⭐ Stars | 🔱 Forks |\n| --- | --- | --- |\n' + '\n'.join(repos)
        content = content.split('<!--START_SECTION:top_repos-->')[0] + \
                  f'<!--START_SECTION:top_repos-->\n{repos_table}\n<!--END_SECTION:top_repos-->' + \
                  content.split('<!--END_SECTION:top_repos-->')[1]
    
    # Update followers section
    content = content.split('<!--START_SECTION:followers-->')[0] + \
              f'<!--START_SECTION:followers-->\n{followers}\n<!--END_SECTION:followers-->' + \
              content.split('<!--END_SECTION:followers-->')[1]
    
    # Write updated content
    with open(readme_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f'✅ README updated successfully at {datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')

if __name__ == '__main__':
    update_readme()
