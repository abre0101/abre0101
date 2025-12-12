import requests

def fetch_top_repositories(token, username, language, translations):
    """Fetch top repositories by stars for a user"""
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    
    url = f'https://api.github.com/users/{username}/repos'
    params = {'per_page': 100, 'sort': 'updated'}
    
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code != 200:
        print(f"Error fetching repositories: {response.status_code}")
        return []
    
    repos = response.json()
    
    # Sort by stars and get top 5
    sorted_repos = sorted(repos, key=lambda x: x.get('stargazers_count', 0), reverse=True)[:5]
    
    repo_lines = []
    for repo in sorted_repos:
        name = repo.get('name', '')
        html_url = repo.get('html_url', '')
        stars = repo.get('stargazers_count', 0)
        forks = repo.get('forks_count', 0)
        
        repo_lines.append(f"| [{name}]({html_url}) | {stars} | {forks} |")
    
    return repo_lines
