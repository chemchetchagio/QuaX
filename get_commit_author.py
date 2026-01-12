import os

import requests
import sys

commit_sha = sys.argv[1]
full_name = sys.argv[2]

if full_name.lower() == 'teskann':
    exit(0)

url = f"https://api.github.com/repos/teskann/quax/commits/{commit_sha}"
username = full_name

github_token = os.getenv('GITHUB_TOKEN')
headers = {
    "Accept": "application/vnd.github+json",
}
if github_token is not None:
    headers["Authorization"] = f"Bearer {github_token}"

response = requests.get(url, headers=headers)

if response.status_code == 200:
    data = response.json()
    try:
        username = f'@{data['author']['login']}'
    except:
        pass
print(f"(by {username}) ")