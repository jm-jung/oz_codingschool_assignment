import requests
from bs4 import BeautifulSoup

header_user={"User-Agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"}
url="https://www.melon.com/chart/index.htm"
req=requests.get(url,headers=header_user)
html=req.text
soup=BeautifulSoup(html,"html.parser")
ranking50=soup.select(".lst50")
ranking100=soup.select(".lst100")
ranking=ranking50+ranking100
for i in ranking:
    rank=i.select(".rank")
    title=i.select(".ellipsis.rank01")
    singer=i.select(".checkEllipsis")
    album=i.select(".ellipsis.rank03")
    for r,t,s,a in zip(rank,title,singer,album):
        print(f"순위 : {r.text}")
        print(f"제목 - {t.text.strip()}")
        print(f"가수 - {s.text}")
        print(f"앨범 - {a.text.strip()}")
        print("---------------------------")

