#vector(向量)  -> 一維陣列
v <- c(10, 5, 3.1, 6.4, 9.2, 21.7)
v
length(v) #求v的長度
mode(v)   #求v的型態

#NA (缺值= Null值)
v <- c(10, 5, NA, 6.4, 9.2, 21.7)
v
v[2]        #求v的第2個索引值

v2 <- 1:10  #v2為1至10
v2          #求v2為多少
v2[1]       #求v2的第1個索引值

#Matrix(矩陣)  -> 二維陣列 (nrow列,ncol行,byrow指以列排序)
x <- matrix(1:24, nrow=4, ncol=6, byrow=TRUE)
x
# 以行排序 -> byrow = FALSE 
y <- matrix(1:24, nrow=4, ncol=6, byrow=FALSE)
y

#cbind()&rbind() #c指直欄,r指橫列
x1 <- c(1,2,3)
x2 <- c(4,5,6)
x3 <- c

xc <- cbind(x1, x2, x3)
xc
xr <- rbind(x1, x2, x3)
xr

#轉置(Trasposition)
xc_t <- t(xc)
xc_t
#求有幾列?
nrow(x)
#求有幾行?
ncol(x)
#求特定行或列的值
x[1,]     #求第1列
x[,2]     #求第2行
x[2,3]    #求第2列第3行


#eigenvalue & eigenvectors(特徵向量)  線性代數
eigen(xc)

#矩陣相乘 %*%
xc
xr
z <- xc %*% xr
z

#Array(陣列) -> 多維度陣列
x <- 1:24
dim(x) <- c(4,6)    #4列6行的陣列 (2維)
x
#另一種語法:(跟上方一樣)
x <- array(1:24, dim=c(4,6))
#求第2列第4行的值
x[2,4]

dim(x) <- c(3,4,2)  #3列4行的陣列,並分成2頁顯示!! (3維)
x <- array(1:24, dim=c(3,4,2))
x
#求特定行或列的值
x[2,3,1]
x[3,1,2]
# 0代表?????????????????????????????????????????????????
x <- array(0, dim=c(4,6))
x

#Factor(因子) -> 類別變數
x <- factor(c("男","女","男","男","女"))
x
#結果會出現levels:女男(找出不同的值有哪些)

#datagrame(資料框架)
id <- c(1,2,3,4)
age <- c(25,30,35,40)
sex <- c("Male","Male","Female","Female")
pay <- c(30000,40000,45000,50000)

x_dataframe <- data.frame(id,age,sex,pay)
x_dataframe
x_dataframe[3,2]  #求第3列第2欄的值
x_dataframe[4,]   #求第4列的值
x_dataframe[2]    #求第2欄的值
x_dataframe$age   #求所有age的值
edit(x_dataframe) #???????????????
x_dataframe

#當更改資料編輯器裡的數值後,如何更新資料?
x_dataframe <- edit(x_dataframe)
x_dataframe

#list列表
id <- c(1,2,3)
sex <- c("Male","Male","Female")
pay <- c(30000,40000,45000)
y_dataframe <- data.frame(id,sex,pay)
gender <- factor(c("男","男","女"))
Paul.Family <- list(name="Paul", wife="Iris", no.kids=3, kids.age=c(25, 28, 30), gender, y_dataframe)
Paul.Family

#取小孩年齡(kids.age)
Paul.Family$kids.age
Paul.Family[4]
Paul.Family[[4]] #去除掉欄位名稱!

Paul.Family$kids.age[2]
Paul.Family[[4]][2]
#錯誤範例: Paul.Family[4][2]

#第2章 資料的讀取與寫入
getwd()
setwd("c:/")  #更改路徑到C槽目錄下
getwd()
#手動將x.csv,x1.. 檔名有x的黨放到C槽!

#讀取檔案 (必須先手動放C槽!!)
x <- read.table("X.csv", sep=",", header=TRUE)
x
str(x)
#取特定欄位的值
x$age
x[1, 2]


#錯誤的範例: header=FALSE
x <- read.table("X.csv", sep=",", header=FALSE)
x
str(x)
#read.csv()函數 -> csv代表sep=","
x <- read.csv("X.csv",header = TRUE)
x

#read.table()   -> 將X.csv檔轉成X.txt檔案 
x <- read.table("X.txt",sep=" ",header=TRUE)#錯的
x

x <- read.table("X.txt",sep="\t",header=TRUE)
x

x <- read.table("X.txt",header=TRUE)
x
#scan()函數 -> 接受鍵盤輸入的資料(直接用key的)
x <-scan("")
x
#也可指定輸入資料的型態 #my後面的等號也可用<-取代
my = scan(file ="", what = list(name = "", pay = integer(0), sex =""))
my

x <- scan("X1.csv",sep =",")
x

x<- scan("X1.csv")
x

#把資料寫入資料檔 write.table
write.table(x,"c:/x4_file.csv",row.names=FALSE,
            col.names=FALSE,sep=",")

x <-scan("X1.csv",sep=",",what=list()id=integer(0),
         age=integer(0),pay=integer(0)))
x

write.table(x,"c:/x1_file.csv",row.names=FALSE,
            col.names=TRUE,sep=",")

#data()內建資料集
data(iris)
iris
str(iris)
#對summary摘要統計!!!
summary(iris)
#將iris資料存檔在C槽:
save(iris,file="c:/iris.Rdaata")
#開啟iris檔:
load("c:/iris.Rdaata",.GlobalEnv())
iris  #執行!!!!

#第三章 流程控制
a <-c(1,2,3)
x <- a+2

#加上括號()代表直接顯示結果
(x<-a+2)

#{}結合命令
{a <-c(1,2,3);x<-a+2}
x
({a <-c(1,2,3);x<-a+2})

#if-else 條件式
x <- 6
if(x > 5) y = 2 else y = 4
y
#多個運算式,以大括號{}圍住
x <- 3
y <- 1
if(x < 5 && y < 5){y <- 10; z <- 5}
y
z
#ifelse()函數
x<-20
y=ifelse(x>5,2,3)
y


#switch()函數 
x <- 1
switch(x,5,sum(1:10),rnorm(5))

y <- 1
switch(y, juice = "Apple", meat = "Pork")

y <- "juice"
switch(y, juice = "Apple", meat = "Pork")

#for迴圈
x <- 0
for(i in 1:5) x <- x+i
x

x<- 0
y<- 0
for(i in 1:5) {x <- x+i; y<- i^2}
x
y

#while迴圈
sum <- 0
i <- 1
while(i <= 10) {sum <- sum+i; i <- i+1}
sum

#repeat迴圈
sum <- 0
i <- 1
repeat{
  sum<- sum + i
  i<- i+1
  if(i>10) break  #跳出迴圈
}
sum

# %% -> 求餘數(求偶數), %/% -> 商數
sum <- 0
for(i in 1:50){
  if(i%%2 == 0) next 
  sum <- sum + i
}
sum

#apply 列加總 or 欄加總
x <- array(1:24, dim = c(4,6))
x
apply(x, 1, sum)  #以陣列的每一列做加總
apply(x, 2, sum)  #以陣列的每一欄做加總

#function (自訂函數) myfun
myfun <- function(x) {y <- x+2; return(y)}
myfun(1)
myfun(100)
myfun() #錯誤的

myfun <- function(x=1) {y <- x+2; return(y)}
myfun(50)
myfun()

# <<- 改變函數外面的值 (少用較佳!!)
x <- 1
myfun <- function(x) {x <- 2; print(x)}
myfun(x)
x
x <- 1
myfun <- function(x) {x <<- 2; print(x)}
myfun(x)
x

#fuctorial階乘
factorial <- function(x=1){
  y <- 1
  for(i in 1:x) y <- y * i
  return(y)
}
factorial(5)
factorial(10)



#第四章 繪圖功能
demo(graphics)
demo(image)

#高階繪圖
y <- sin(1:20)
plot(y,type = "l",main="Sin Plot",xlab = "X",ylab = "Y")

#低階繪圖
title(sub = "圖4-2")
points(5,0.5) #points在現有的圖形上加一個點

#互動式繪圖
plot(2,2)
pts <- locator(n=3)
pts

#identify 按滑鼠左鍵約點選圓圈內
x <- c(1,3,5)
y <- c(5,3,5)
plot(x,y)
identify(x,y,"My Labels")



