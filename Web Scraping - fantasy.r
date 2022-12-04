library(robotstxt)
library(rvest)

#scrapping websites
url<-"https://www.amazon.in/gp/most-wished-for/books/1318163031?ref_=Oct_d_omwf_S&pd_rd_w=Lh3vn&content-id=amzn1.sym.434d119d-9748-44f8-9f20-db43f557cf30&pf_rd_p=434d119d-9748-44f8-9f20-db43f557cf30&pf_rd_r=WRTRV5JJG71ZEGEA7MB4&pd_rd_wg=RvR3s&pd_rd_r=e1a6c7dd-b271-426f-98e7-5dfdecd97437"

#allowability
path=paths_allowed(url)

#HTML elements from websites
web<-read_html(url)

#segregating titles
title<-web%>%html_nodes("#p13n-asin-index-22 .a-link-normal ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-21 .a-link-normal ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-13 .a-link-normal ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-5 .a-link-normal ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-4 .a-link-normal ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y")%>%html_text()
View(title)

#segregating author
author<-web%>%html_nodes("#p13n-asin-index-22 .a-link-child ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-21 .a-link-child ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-13 .a-link-child ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-5 .a-link-child ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y , #p13n-asin-index-4 .a-link-child ._cDEzb_p13n-sc-css-line-clamp-1_1Fn1y")%>%html_text()
View(author)

#segregating price
price<-web%>%html_nodes("#p13n-asin-index-22 ._cDEzb_p13n-sc-price_3mJ9Z , #p13n-asin-index-21 ._cDEzb_p13n-sc-price_3mJ9Z , #p13n-asin-index-13 ._cDEzb_p13n-sc-price_3mJ9Z , #p13n-asin-index-5 ._cDEzb_p13n-sc-price_3mJ9Z , #p13n-asin-index-4 ._cDEzb_p13n-sc-price_3mJ9Z")%>%html_text()
View(price)

#segregating rating
rating<-web%>%html_nodes("#p13n-asin-index-22 .aok-align-top , #p13n-asin-index-21 .aok-align-top , #p13n-asin-index-13 .aok-align-top , #p13n-asin-index-5 .aok-align-top , #p13n-asin-index-4 .aok-align-top")%>%html_text()
View(rating)

#segregating rank
rank<-web%>%html_nodes("#p13n-asin-index-22 .zg-bdg-text , #p13n-asin-index-21 .zg-bdg-text , #p13n-asin-index-13 .zg-bdg-text , #p13n-asin-index-5 .zg-bdg-text , #p13n-asin-index-4 .zg-bdg-text")%>%html_text()
View(rank)

#creating dataframe
fantasy<-data.frame(title,author,price,rating,rank)
View(fantasy)

#saving data
write.csv(fantasy,"fantasy.csv")
