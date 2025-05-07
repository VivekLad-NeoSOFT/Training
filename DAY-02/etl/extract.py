import requests


class ExtractData:
    def __init__(self) -> None:
        pass

    def read_api(self, url: str, key: str = None):
        headers = {'X-API-Key': key}
        response = requests.get(url=url, headers=headers)
        print(response)
