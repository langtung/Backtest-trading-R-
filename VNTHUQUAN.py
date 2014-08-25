from selenium import webdriver
driver = webdriver.Firefox()
driver.get("http://vnthuquan.net/truyen/")
text=[]
stop=0
stop1=0
while stop1<100:
	#text.append(driver.page_source)
	#stop=int(driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[1].text)
	#if stop=1:
		

	#nextPageCollections=driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[10]
	
	#nextPageCollections.click()
	
	stop=1
	while (stop1%10)==0:
		text.append(driver.page_source)
		stop1=int(driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[stop].text)
		
		a=driver.find_elements_by_xpath("//td[@colspan='4']/a[@href]")[stop].click()
		stop+=1
		
	
	

	




