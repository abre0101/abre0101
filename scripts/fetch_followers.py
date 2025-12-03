import requests
import time

def handle_rate_limit(headers):
    """Check and handle GitHub API rate limits"""
    url = 'https://api.github.com/rate_limit'
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        rate_limit = response.json()
        remaining = rate_limit['rate']['remaining']
        reset_time = rate_limit['rate']['reset']
        
        if remaining == 0:
            wait_time = reset_time - time.time() + 1
            print(f"Rate limit exceeded. Waiting for {wait_time} seconds...")
            time.sleep(wait_time)

def fetch_followers(token, username, max_followers=14):
    """Fetch followers for a user"""
    headers = {
        'Authorization': f'token {token}',
        'Accept': 'application/vnd.github.v3+json'
    }
    
    followers = []
    page = 1
    
    while len(followers) < max_followers:
        handle_rate_limit(headers)
        
        url = f'https://api.github.com/users/{username}/followers'
        params = {'per_page': 100, 'page': page}
        
        response = requests.get(url, headers=headers, params=params)
        
        if response.status_code != 200:
            print(f"Error fetching followers: {response.status_code}")
            break
        
        follower_list = response.json()
        
        if not follower_list:
            break
        
        for follower in follower_list:
            followers.append({
                'login': follower['login'],
                'id': follower['id'],
                'name': follower.get('name') or follower['login']
            })
            
            if len(followers) >= max_followers:
                break
        
        page += 1
    
    return followers[:max_followers]

def generate_followers_table(token, username):
    """Generate HTML table of followers"""
    followers = fetch_followers(token, username)
    
    if not followers:
        return "No followers found."
    
    # Split followers into rows of 7
    rows = []
    for i in range(0, len(followers), 7):
        row_followers = followers[i:i+7]
        row_html = ""
        
        for follower in row_followers:
            row_html += f"""<td align="center">
  <a href="https://github.com/{follower['login']}">
    <img src="https://avatars.githubusercontent.com/u/{follower['id']}" width="75px" alt="{follower['login']}" />
    <br />
    <sub>{follower['name']}</sub>
  </a>
</td>
"""
        rows.append(f"<tr>{row_html}</tr>")
    
    table_html = f"""<table>
  {chr(10).join(rows)}
</table>
"""
    
    return table_html
