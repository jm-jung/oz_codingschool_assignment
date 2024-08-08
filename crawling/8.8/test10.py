from selenium import webdriver
from bs4 import BeautifulSoup
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
user = "Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1"

options = Options()
options.add_argument(f"user-agent={user}")
options.add_experimental_option("detach", True)
options.add_experimental_option("excludeSwitches", ["enable-logging"])


#크롬 드라이버 매니저를 자동으로 설치되도록 실행시키는 코드
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(options=options)

url = "https://m2.melon.com/index.htm"
driver.get(url)
time.sleep(5)

driver.find_element(By.CSS_SELECTOR,".link-logo").click()
time.sleep(4)
menu=driver.find_elements(By.CSS_SELECTOR,".nav_item")
menu[2].click()
time.sleep(5)
driver.find_element(By.TAG_NAME,"body").send_keys(Keys.END)
time.sleep(2)
driver.find_element(By.XPATH,'//button[@onclick="hasMore2();"]').click()
time.sleep(3)
driver.find_element(By.TAG_NAME,"body").send_keys(Keys.END)
time.sleep(2)
html=driver.page_source
soup = BeautifulSoup(html, "html.parser")
music=soup.select(".list_item")

for i in music:
    ranking=i.select(".ranking_num")
    title=i.select(".title.ellipsis")
    singer=i.select(".name.ellipsis")
    for r,t,s in zip(ranking,title,singer):
        print(r.text.strip())
        print(f"제목: {t.text.strip()}")
        print(f"가수: {s.text.strip()}")
        print("------------------------------------")
#아래 순서대로 스크래핑한 자료를 출력해주세요
#순위 :
#노래 제목 :
#가수 이름 :

driver.quit()