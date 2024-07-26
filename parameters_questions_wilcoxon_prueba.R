alpha<-sample(x=c(0.01,0.05),size=1)

n1<-sample(6:10, size=1)
n2<-n1+sample(-1:1, size = 1)

meanw<-(n1*(n1+n2+1))/2
sdw<-sqrt((n1*n2*(n1+n2+1))/12)
  
crit_val<-qnorm(alpha, meanw, sdw)

data<-sample(1:100, size=(n1+n2))

ranks1<-rep(0,n1)
sum_crit<-crit_val
wrong_loop<-0
while (i <= n1) {
  
  rank1_proposed<-sample
  if((rank1_proposed%in%ranks1) || ((sum_crit-rank1_proposed) < 1)){ #This can be a problem...maybe larger than 1
    wrong_loop<-wrong_loop1
  }else{
    ranks1[i]<-rank1_proposed
    sum_crit<-sum_crit-ranks1[i]
    i<-i+1
  }
  
  if(wrong_loop>1000){
    ranks1<-sample(1:(n1+n2),n1)
    ranks2<-which(!(1:(n1+n2))%in%ranks1)
    break
  }
  
}

#Alternative:
#ranks1<-sample(1:(n1+n2),n1)
#ranks2<-which(!(1:(n1+n2))%in%ranks1)

#ranked_data<-rank(data)
