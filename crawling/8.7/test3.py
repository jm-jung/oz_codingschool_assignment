import requests
from bs4 import BeautifulSoup

header_user={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
url="https://search.naver.com/search.naver?ssc=tab.blog.all&sm=tab_jum&query="
keyword=input("검색어를 입력하세요")

url=url+keyword
req=requests.get(url,header_user)
html=req.text
# print(req.raise_for_status)
# print(req.request)
soup=BeautifulSoup(html,"html.parser")
# print(soup)
wrap=soup.select(".view_wrap")

for i in wrap:
    ad=soup.select(".spblog ico_ad")
    if not ad:
        title=soup.select(".title_link")
        name=soup.select(".name")
        for noad in zip(title,name):
            print(noad[0].text)
            print(noad[1].text)
# for i in zip(title,name):
#     print(i[0].text)
#     print(i[1].text)
#     print(i[0]["href"])
# # print(query)

