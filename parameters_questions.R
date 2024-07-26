parameters_questions<-function(test,question){
  
  
  if(test=="chi"){
    
    #sample dimensions
    
    
    tsize<-sample(x=1:4,size=1)
    nrows<-ifelse(tsize<3,2,3)
    ncols<-ifelse(tsize%%2==1,2,3)
    ncells<-nrows*ncols
    
    #tsize=1 2x2
    #tsize=2 2x3
    #tsize=3 3x2
    #tsize=4 3x3
    
    #alpha value
    alpha<-sample(x=c(0.01,0.05),size=1)
    
    
    #sample n
    #n<-sample((8*ncells):(20*ncells),size=1)
    
    
    #sample margins
    # mrow<-c()
    # n_row<-n
    # for (i in 1:(nrows-1)) {
    #   mrow[i]<-round(sample(size=1, x=(min(5,n/(6*nrows))):min(n_row,(2*n/nrows)-8*(nrows-i))))
    #   n_row<-n_row-mrow[i]
    # }
    # mrow[nrows]<-n-sum(mrow)
    mrow<-c()
    
    for (i in 1:nrows) {
      mrow[i]<-round(sample(size=1, x=20:10*ncells))
      
    }
    
    n<-sum(mrow)
    
    # mcol<-c()
    # n_col<-n
    # for (i in 1:(ncols-1)) {
    #   mcol[i]<-round(sample(size=1, x=(min(5,n/(6*ncols))):min(n_col,(2*n/ncols)-8*(ncols-i))))
    #   n_col<-n_col-mcol[i]
    # }
    # mcol[ncols]<-n-sum(mcol)
    mcol<-c()
    n_col<-n
    for (i in 1:(ncols-1)) {
      mcol[i]<-round(sample(size=1, x=(max(10,n/4)):(n_col/2)))#CHECK
      n_col<-n_col-mcol[i]
    }
    mcol[ncols]<-n-sum(mcol)
    
    
    
    #compute expected frequencies and contribution per cell
    expected_cell<-matrix(NA, ncol = ncols, nrow = nrows)
    
    for (i in 1:nrows) {
      for (j in 1:ncols) {
        expected_cell[i,j]<-mrow[i]*mcol[j]/n
      }  
    }
    
    
    #based on alpha and the expected frequencies obtain the observed frequencies
    df<-(ncols-1)*(nrows-1)
    
    
    
    if(alpha==0.01){
      if(df==1){
        limit_chi_value<-6.63
      }else if(df==2){
        limit_chi_value<-9.21
      }else if(df==4){
        limit_chi_value<-13.28
      }
      
    }else if(alpha==0.05){
      if(df==1){
        limit_chi_value<-3.84
      }else if(df==2){
        limit_chi_value<-5.99
      }else if(df==4){
        limit_chi_value<-9.49
      }
    }
    
    
    #chi_per_cell<-limit_chi_value/ncells
    
    sign<-matrix(NA, nrow = nrows, ncol = ncols)
    if(tsize==1){
      sign[1,1]<-sample(x=c(-1,1),size=1)
      sign[1,2]<-sign[1,1]*(-1)
      sign[2,1]<-sign[1,2]
      sign[2,2]<-sign[1,1]
      chi_per_cell<-limit_chi_value/4 #4 is the number of cells with non-zero sign
    }else if(tsize==2){
      sign[1,1]<-sample(x=-1:1,size=1)
      sign[1,2]<-ifelse(sign[1,1]==0,sample(x=c(-1,1),size=1),sample(x=c(0,(-1)*sign[1,1]),size=1))
      sign[1,3]<-(-1)*sum(sign[1,1:2])
      sign[2,1]<-(-1)*sign[1,1]
      sign[2,2]<-(-1)*sign[1,2]
      sign[2,3]<-(-1)*sign[1,3] 
      chi_per_cell<-limit_chi_value/4 #4 is the number of cells with non-zero sign
    }else if(tsize==3){
      sign[1,1]<-sample(x=-1:1,size=1)
      sign[1,2]<-(-1)*sign[1,1]
      sign[2,1]<-ifelse(sign[1,1]==0,sample(x=c(-1,1),size=1),sample(x=c(0,(-1)*sign[1,1]),size=1))
      sign[2,2]<-(-1)*sign[2,1]
      sign[3,1]<-(-1)*sum(sign[1:2,1])
      sign[3,2]<-(-1)*sign[3,1]   
      chi_per_cell<-limit_chi_value/4 #4 is the number of cells with non-zero sign
    }else if(tsize==4){
      #source("sign22.R")
      sign[1,1]<-sample(x=-1:1,size=1)
      sign[1,2]<-ifelse(sign[1,1]==0,sample(x=c(-1,1),size=1),sample(x=c(0,(-1)*sign[1,1]),size=1))
      sign[1,3]<-(-1)*sum(sign[1,1:2])
      sign[2,1]<-ifelse(sign[1,1]==0,sample(x=c(-1,1),size=1),sample(x=c(0,(-1)*sign[1,1]),size=1))
      sign[2,2]<-sign22(sign11=sign[1,1],sign12=sign[1,2],sign21=sign[2,1])#Think about this one
      sign[2,3]<-(-1)*sum(sign[2,1:2]) 
      sign[3,1]<-(-1)*sum(sign[1:2,1])
      sign[3,2]<- (-1)*sum(sign[1:2,2])
      sign[3,3]<-(-1)*sum(sign[3,1:2])  
      chi_per_cell<-limit_chi_value/6 #6 is the number of cells with non-zero sign
    }
    
    
    
    observed_cells<-matrix(NA, ncol = ncols, nrow = nrows)
    # for (i in 1:nrows) {
    #   for (j in 1:(ncols-1)) {
    #     observed_cells[i,j]<-round(max(5,expected_cell[i,j]+chi_per_cell*sample(x=-3:3, size=1)))
    #   }  
    #   observed_cells[i,ncols]<-max(5,mrow[i]-sum(observed_cells[i,1:(ncols-1)]))
    # }
    
    for (i in 1:nrows) {
      for (j in 1:ncols){
        observed_cells[i,j]<-max(0,round(expected_cell[i,j]+sign[i,j]*sqrt(chi_per_cell*expected_cell[i,j])+sample(x=-5:5,size=1)))
      }  
    }
    
    total<-sum(observed_cells)
    
    
    expected_freq<-chisq.test(observed_cells)$expected
    

    cell_contrib<-matrix(NA, nrow = nrows, ncol = ncols)
    
    for (i in 1:nrows) {
      for (j in 1:ncols) {
        cell_contrib[i,j]<-((observed_cells[i,j] - expected_freq[i,j])^2)/expected_freq[i,j]
      }  
    }
    
    
    
    #run chi square test and compute effect size
    chitest<-chisq.test(x=observed_cells, correct = FALSE) 
    
    chi_value<-round(chitest$statistic,3)
    df<-chitest$parameter
    p_value<-round(chitest$p.value,3) 
    decision<-ifelse(chitest$p.value > alpha,1,2) 
    
    
    if(alpha==0.01){
      pval1<-"p > 0.01"
      pval2<-"0.01 &ge; p &ge; 0.005"
      pval3<-"0.005 > p &ge; 0.001"
      pval4<-"p < 0.001"
      if(p_value > 0.01){
        pval_button<-1
      }else if((0.01 >= p_value) && (p_value >= 0.005)){
        pval_button<-2
      }else if((0.005 > p_value) && (p_value >= 0.001)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }else if(alpha==0.05){
      pval1<-"p > 0.05"
      pval2<-"0.05 &ge; p &ge; 0.025"
      pval3<-"0.025 > p &ge; 0.01"
      pval4<-"p < 0.01"
      if(p_value > 0.05){
        pval_button<-1
      }else if((0.05 >= p_value) && (p_value >= 0.025)){
        pval_button<-2
      }else if((0.025 > p_value) && (p_value >= 0.01)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }
    
    
    
    if(tsize==1){
      effect_size<-round(sqrt(chi_value/total),3)
    }else{
      effect_size<-round(sqrt(((chi_value)/n)/(min(nrows-1,ncols-1))),3) #round(sqrt(((chi_value^2)/n)/(min(nrows-1,ncols-1))),3)
    }
    
    cells<-cbind(paste0('Y=',1:dim(observed_cells)[1]),observed_cells)
    
    
    param<-list(alpha=alpha,n=total,cells=cells, contrib_cell=round(cell_contrib,3) , chi=chi_value, df=df, p=p_value, pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=effect_size)  
    
    
  }else if(test=="t_one"){
    
    hig_low_dif<-sample(c("lower","higher","different"), size=1)
    #zero_mean<-rbinom(n=1,size=1,prob=0.5)
    stdText<-""
    
    # if(zero_mean){
    #   meanH0<-0
    #   stdText<-"standarized "
    # }else{
      meanH0<-sample(160:180, size=1)
    # }
    
    n<-sample(x=5:8, size=1)
    alpha<-sample(x=c(0.01,0.05),size=1)
    df<-n-1
    
    
    
    if(hig_low_dif=="lower"){
      ct<-floor(100*qt(alpha,df))/100
    }else if(hig_low_dif=="higher"){
      ct<-floor(100*qt(1-alpha,df))/100
    }else if(hig_low_dif=="different"){
      sign<-sample(x=c(-1,1), size = 1)
      if(sign==-1){
        ct<-sign*floor(100*qt((1-alpha)/2,df))/100
      }else{
        ct<-sign*floor(100*qt((alpha/2),df))/100
      }
      
    } 
    
    
    #ct<- -qt(alpha,df) #critical t value
    
    s<-runif(n=1,min=4,max=8)
    
    mean_sample<-(ct*s/sqrt(n))+meanH0
    
    sample<-round(rnorm(n=n, mean=mean_sample, sd=s))
    
    mean_1<-mean(sample)
    sd_1<-sd(sample)
    
    se<-sd_1/sqrt(n)
    
    if(hig_low_dif=="lower"){
      type<-"less"
      hig_low_dif_text<-"lower than"
    }else if(hig_low_dif=="higher"){
      type<-"greater"
      hig_low_dif_text<-"higher than"
    }else if(hig_low_dif=="different"){
      type<-"two.sided"
      hig_low_dif_text<-"different from"
    }
    
    t_test<-t.test(sample, mu=meanH0, conf.level = (1-alpha), alternative = type, var.equal = FALSE)
    
    t_value<-t_test$statistic
    p_value<-t_test$p.value
    
    #p_value intervals
    
    if(alpha==0.01){
      pval1<-"p > 0.01"
      pval2<-"0.01 &ge; p &ge; 0.005"
      pval3<-"0.005 > p &ge; 0.001"
      pval4<-"p < 0.001"
      if(p_value > 0.01){
        pval_button<-1
      }else if((0.01 >= p_value) && (p_value >= 0.005)){
        pval_button<-2
      }else if((0.005 > p_value) && (p_value >= 0.001)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }else if(alpha==0.05){
      pval1<-"p > 0.05"
      pval2<-"0.05 &ge; p &ge; 0.025"
      pval3<-"0.025 > p &ge; 0.01"
      pval4<-"p < 0.01"
      if(p_value > 0.05){
        pval_button<-1
      }else if((0.05 >= p_value) && (p_value >= 0.025)){
        pval_button<-2
      }else if((0.025 > p_value) && (p_value >= 0.01)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }
    
    
    decision<-ifelse(p_value > alpha,1,2) 
    
    efSize<-abs(mean_1-meanH0)/sd_1
    
    param<-list(alpha=alpha, mu=meanH0, n=n, sample= sample, mean= round(mean_1,digits = 3), sd= round(sd_1,digits = 3), se= round(se,digits = 3), t=round(t_value,digits = 3), 
                df=df, p=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=round(efSize,digits = 3), stdText= stdText, hig_low_dif=hig_low_dif_text)
  
    
    
    
    
    
  }else if(test=="t_paired"){
    
    
    
    hig_low_dif<-sample(c("lower","higher","different"), size=1)
    #zero_mean<-rbinom(n=1,size=1,prob=0.5)
    stdText<-""
    
    # if(zero_mean){
    #   meanH0<-0
    #   stdText<-"standarized "
    # }else{
    meanH0<-0 #sample(160:180, size=1)
    # }
    
    n<-sample(x=5:8, size=1)
    
    alpha<-sample(x=c(0.01,0.05),size=1)
    df<-n-1
    
    
    
    
    
    
    if(hig_low_dif=="lower"){
      ct<-floor(100*qt(alpha,df))/100
    }else if(hig_low_dif=="higher"){
      ct<-floor(100*qt(1-alpha,df))/100
    }else if(hig_low_dif=="different"){
      sign<-sample(x=c(-1,1), size = 1)
      if(sign==-1){
        ct<-sign*floor(100*qt((1-alpha)/2,df))/100
      }else{
        ct<-sign*floor(100*qt((alpha/2),df))/100
      }
      
    } 
    
    
    #ct<- -qt(alpha,df) #critical t value
    
    s<-runif(n=1,min=4,max=8)
    
    mean_diff<-(ct*s/sqrt(n))+meanH0
    
    diff<-round(rnorm(n=n, mean=mean_diff, sd=s))
    
    m1<-sample(x=160:180, size=1)
    
    sample1<-rnorm(n=n, mean=m1, sd=s)
    
    # mean_1<-mean(sample1)
    # sd_1<-sd(sample1)
    
    sample2<-rnorm(n=n, mean = m1+mean_diff, sd=s)
    
    # mean_2<-mean(sample2)
    # sd_2<-sd(sample2)
    
    sample_diff<-sample1-sample2
    
    mean_1<-mean(sample_diff)
    sd_1<-sd(sample_diff)
    
    se<-sd_1/sqrt(n)
    
    if(hig_low_dif=="lower"){
      type<-"less"
      hig_low_dif_text<-"lower than"
    }else if(hig_low_dif=="higher"){
      type<-"greater"
      hig_low_dif_text<-"higher than"
    }else if(hig_low_dif=="different"){
      type<-"two.sided"
      hig_low_dif_text<-"different from"
    }
    
    t_test<-t.test(sample_diff, mu=meanH0, conf.level = (1-alpha), alternative = type)
    
    t_value<-t_test$statistic
    p_value<-t_test$p.value
    
    #p_value intervals
    
    if(alpha==0.01){
      pval1<-"p > 0.01"
      pval2<-"0.01 &ge; p &ge; 0.005"
      pval3<-"0.005 > p &ge; 0.001"
      pval4<-"p < 0.001"
      if(p_value > 0.01){
        pval_button<-1
      }else if((0.01 >= p_value) && (p_value >= 0.005)){
        pval_button<-2
      }else if((0.005 > p_value) && (p_value >= 0.001)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }else if(alpha==0.05){
      pval1<-"p > 0.05"
      pval2<-"0.05 &ge; p &ge; 0.025"
      pval3<-"0.025 > p &ge; 0.01"
      pval4<-"p < 0.01"
      if(p_value > 0.05){
        pval_button<-1
      }else if((0.05 >= p_value) && (p_value >= 0.025)){
        pval_button<-2
      }else if((0.025 > p_value) && (p_value >= 0.01)){
        pval_button<-3
      }else{
        pval_button<-4
      }
    }
    
    
    decision<-ifelse(p_value > alpha,1,2) 
    
    efSize<-abs(mean_1-meanH0)/sd_1
    
    param<-list(alpha=alpha, mu=meanH0, n=n, sample1= sample1, sample2=sample2, diff=sample_diff, mean= round(mean_1,digits = 3), sd= round(sd_1,digits = 3), se= round(se,digits = 3), t=round(t_value,digits = 3), 
                df=df, p=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=round(efSize,digits = 3), stdText= stdText, hig_low_dif=hig_low_dif_text)
    
    
    
    
    
    
    
    }else if(test=="t_two"){
    
      hig_low_dif<-sample(c("lower","higher","different"), size=1)
      
      n1<-sample(x=5:8, size=1)
      n2<-sample(x=5:8, size=1)
      alpha<-sample(x=c(0.01,0.05),size=1)
      
      mean1<-sample(10:20, size=1)
      s1<-runif(n=1,min=1.25,max=8)#variance
      s2<-runif(n=1, min=s1-1,max = s1+1)#variance
      
      sample1<-round(rnorm(n=n1, mean=mean1, sd=sqrt(s1)))
      
      df<-(((s1/n1)+(s2/n2))^2)/((((s1/n1)^2)/(n1-1))+(((s2/n2)^2)/(n2-1)))
      
      
      if(hig_low_dif=="lower"){
        ct<-floor(100*qt(alpha,df))/100
      }else if(hig_low_dif=="higher"){
        ct<-floor(100*qt(1-alpha,df))/100
      }else if(hig_low_dif=="different"){
        sign<-sample(x=c(-1,1), size = 1)
        if(sign==-1){
          ct<-sign*floor(100*qt((1-alpha)/2,df))/100
        }else{
          ct<-sign*floor(100*qt(alpha/2,df))/100
        }
        
      } 
      
      #ct<- -qt(alpha,df)
      
      mean2<-mean1-ct*sqrt((s1/n1)+(s2/n2))
      
      sample2<-round(rnorm(n=n2, mean=mean2, sd=sqrt(s2)))
      
      
      mean_s1<-mean(sample1)
      sd_s1<-sd(sample1)
      mean_s2<-mean(sample2)
      sd_s2<-sd(sample2)
      
      se<-sqrt((sd_s1^2)/n1+(sd_s2^2)/n2)
      
      if(hig_low_dif=="lower"){
        type<-"less"
        hig_low_dif_text<-"lower than"
      }else if(hig_low_dif=="higher"){
        type<-"greater"
        hig_low_dif_text<-"higher than"
      }else if(hig_low_dif=="different"){
        type<-"two.sided"
        hig_low_dif_text<-"different from"
      }
      
      t_results<-t.test(x=sample1, y=sample2, conf.level = (1-alpha), alternative = type)
      
      t_value<-t_results$statistic
      df<-t_results$parameter
      p_value<-t_results$p.value
      
      
      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }
      
      
      decision<-ifelse(p_value > alpha,1,2) 
      
      efSize<-t_value^2/(t_value^2 + df)#abs(mean_s1-mean_s2)/se    #use cohensD function?
      
    
    param<-list(alpha=alpha, n1=n1, n2=n2, sample1= sample1, sample2=sample2, mean1= round(mean_s1,digits = 3), sd1= round(sd_s1,digits = 3), mean2= round(mean_s2,digits = 3), sd2= round(sd_s2,digits = 3), se= round(se,digits = 3), t=round(t_value,digits = 3), 
                df=round(df,digits = 3), p=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=round(efSize,digits = 3), hig_low_dif=hig_low_dif_text)
    
    
    
    
    }else if(test=="z_one"){
    
        hig_low_dif<-sample(c("lower","higher","different"), size=1)
        n<-sample(x=5:40, size=1)
        alpha<-sample(x=c(0.01,0.05),size=1)
        
        p0<-round(runif(n=1, min = 0.25, max=0.74),digits = 1)
        
        
        
        if(hig_low_dif=="lower"){
          cz<-floor(100*qnorm(alpha))/100
        }else if(hig_low_dif=="higher"){
          cz<-floor(100*qnorm(1-alpha))/100
        }else if(hig_low_dif=="different"){
          sign<-sample(x=c(-1,1), size = 1)
          if(sign==-1){
            cz<-sign*floor(100*qnorm((1-alpha)/2))/100
          }else{
            cz<-sign*floor(100*qnorm(alpha/2))/100
          }
          
        } 
        
        
        sd<-sqrt(p0*(1-p0)/n)
        
        p<-round(cz*sd+p0,digits=1)
        
        g1<-max(round(p*n),1)
        
        

        
        p1<-g1/n
        
        z_value<-(p1-p0)/sd
        
        if(hig_low_dif=="lower"){
          p_value<-pnorm(z_value)
          hig_low_dif_text<-"lower than"
        }else if(hig_low_dif=="higher"){
          p_value<-1-pnorm(z_value)
          hig_low_dif_text<-"higher than"
        }else if(hig_low_dif=="different"){
          p_value<-2*pnorm(-abs(z_value))
          hig_low_dif_text<-"different from"
        }  
        
        
        
        if(alpha==0.01){
          pval1<-"p > 0.01"
          pval2<-"0.01 &ge; p &ge; 0.005"
          pval3<-"0.005 > p &ge; 0.001"
          pval4<-"p < 0.001"
          if(p_value > 0.01){
            pval_button<-1
          }else if((0.01 >= p_value) && (p_value >= 0.005)){
            pval_button<-2
          }else if((0.005 > p_value) && (p_value >= 0.001)){
            pval_button<-3
          }else{
            pval_button<-4
          }
        }else if(alpha==0.05){
          pval1<-"p > 0.05"
          pval2<-"0.05 &ge; p &ge; 0.025"
          pval3<-"0.025 > p &ge; 0.01"
          pval4<-"p < 0.01"
          if(p_value > 0.05){
            pval_button<-1
          }else if((0.05 >= p_value) && (p_value >= 0.025)){
            pval_button<-2
          }else if((0.025 > p_value) && (p_value >= 0.01)){
            pval_button<-3
          }else{
            pval_button<-4
          }
        }
        
        
        
        decision<-ifelse(p_value > alpha,1,2) 
        
        #efSize<-z_value #abs(mean_s1-mean_s2)/se #missing!!!!!!!!!!!!!!!!
        
        
        
        
        param<-list(alpha=alpha, p1=round(p1,3), p0=p0, good=g1, n=n, sd = sd, z=round(z_value,digits = 3), 
                    pval=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, hig_low_dif=hig_low_dif_text)
      
    
    }else if(test=="z_means"){
      
      hig_low_dif<-sample(c("lower","higher","different"), size=1, prob = c(1/3,1/3,1/3))
      n<-sample(x=4:8, size=1)
      alpha<-sample(x=c(0.01,0.05),size=1)
      
      mu<-sample(x=80:120, size=1) #100#sample(x=30:50, size=1)
      sigma<-round(runif(n=1, min = 3, max=15),digits = 1)
      
      
      if(hig_low_dif=="lower"){
        cz<-floor(100*qnorm(alpha))/100
      }else if(hig_low_dif=="higher"){
        cz<-floor(100*qnorm(1-alpha))/100
      }else if(hig_low_dif=="different"){
        sign<-sample(x=c(-1,1), size = 1)
        if(sign==-1){
          cz<-sign*floor(100*qnorm((1-alpha)/2))/100
        }else{
          cz<-sign*floor(100*qnorm(alpha/2))/100
        }
        
      } 
      
      
      mean0<-round(cz*(sigma/sqrt(n))+mu,digits=1)
      
      x<-round(rnorm(n=n, mean = mean0, sd = sigma))
      
      meanX<-mean(x)
      
      se<-(sigma/sqrt(n))
      
      z_value<- (meanX-mu)/(sigma/sqrt(n))
      
      
      if(hig_low_dif=="lower"){
        p_value<-pnorm(z_value)
      }else if(hig_low_dif=="higher"){
        p_value<-1-pnorm(z_value)
      }else if(hig_low_dif=="different"){
        p_value<-2*pnorm(-abs(z_value))
      }  
      
      
      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }
      
      
      
      decision<-ifelse(p_value > alpha,1,2) 
      
      #efSize<-z_value #abs(mean_s1-mean_s2)/se #missing!!!!!!!!!!!!!!!!
      
      
      
      
      param<-list(alpha=alpha, mean=round(meanX,3), sample=x, n=n , mu=mu, sd = sigma, se=se, z=round(z_value,digits = 3), 
                  pval=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, hig_low_dif=hig_low_dif)
      
      
    }else if(test=="z_two"){
      
      
      hig_low_dif<-sample(c("lower","higher","different"), size=1)
      n1<-sample(x=10:30, size=1)
      n2<-sample(x=5:40, size=1)
      alpha<-sample(x=c(0.01,0.05),size=1)


      g1<-sample(x=1:n1, size=1)


      p1<-g1/n1


      cz<-qnorm(alpha/2)



      g2func<-function(g2, g1, n1, n2, cz){
        ((g1/n1-g2/n2)/sqrt(((g1+g2)/(n1+n2))*(1-((g1+g2)/(n1+n2)))*(1/n1 + 1/n2)))-cz
      }


      #solve using newton raphson
      g2<-pracma::newtonRaphson(fun=g2func,x0=g1, tol=0.0001, g1=g1, n1=n1, n2=n2, cz=cz)$root

      g2<-round(g2)

      #check wheter solution is >=1 and <=n2

      if(g2<=n2 && g2>=1){
        g2<-g2
      }else{#otherwise, sample a value between 1 and n2 randomly
        g2<-sample(x=1:n2, size = 1)
      }


      p2<-g2/n2

      p<-(g1+g2)/(n1+n2)

      sd<-sqrt(p*(1-p)*(1/n1 + 1/n2))

      z_value<-(p1-p2)/sd


      if(hig_low_dif=="lower"){
        p_value<-pnorm(z_value)
      }else if(hig_low_dif=="higher"){
        p_value<-1-pnorm(z_value)
      }else if(hig_low_dif=="different"){
        p_value<-2*pnorm(-abs(z_value))
      }


      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }



      decision<-ifelse(p_value > alpha,1,2)

      efSize<-z_value #abs(mean_s1-mean_s2)/se #missing!!!!!!!!!!!!!!!!




      param<-list(alpha=alpha, p1=p1, p2=p2, p=p, n1=n1, n2=n2, sd = sd, z=round(z_value,digits = 3),
                 pval=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=round(efSize,digits = 3), hig_low_dif=hig_low_dif_text)

    }else if(test=="good"){
      
      #sample dimensions
      
      #Vector size
      vsize<-sample(x=3:8,size=1)

      #alpha value
      alpha<-sample(x=c(0.01,0.05),size=1)
      
      
      #sample n
      n<-sample((10*vsize):(40*vsize),size=1)
      
      
      
      
      
      #compute expected frequencies and contribution per cell
      expected<-rep(n/vsize, vsize)
      
      
      #based on alpha and the expected frequencies obtain the observed frequencies
      df <- vsize-1
      
      
      # Another form to compute the critical chi value
      #crit_chi<-qchisq(alpha,df) #critical chi value
      
      if(alpha==0.01){
        if(df==2){
          limit_chi_value<-9.21
        }else if(df==3){
          limit_chi_value<-11.34
        }else if(df==4){
          limit_chi_value<-13.28
        }else if(df==5){
          limit_chi_value<-15.09
        }else if(df==6){
          limit_chi_value<-16.81
        }else if(df==7){
          limit_chi_value<-18.48
        }
      }else if(alpha==0.05){
        if(df==2){
          limit_chi_value<-5.99
        }else if(df==3){
          limit_chi_value<-7.81
        }else if(df==4){
          limit_chi_value<-9.49
        }else if(df==5){
          limit_chi_value<-11.07
        }else if(df==6){
          limit_chi_value<-12.59
        }else if(df==7){
          limit_chi_value<-14.07
        }
      }
      
      
      chi_per_cell<-limit_chi_value/vsize 
      
      observed<-rep(NA,vsize)
      for (i in 1:vsize) {
        observed[i] <- ceiling(expected[i]+sample(c(-1,1),1)*runif(1, min = (chi_per_cell-10), max = (chi_per_cell+10)))
        observed[i] <- max(1, observed[i]) #avoid negative frequencies
      }
            
      total <- sum(observed)
      
      expected_freq<-chisq.test(observed)$expected
      
      
      cell_contrib<-rep(NA, vsize)
      
      for (i in 1:vsize) {
        cell_contrib[i]<-((observed[i] - expected_freq[i])^2)/expected_freq[i]
      }
      
      
      
      #run chi square test and compute effect size
      chitest<-chisq.test(x=observed, correct = FALSE) 
      
      chi_value<-round(chitest$statistic,3)
      df<-chitest$parameter
      p_value<-round(chitest$p.value,3) 
      decision<-ifelse(chitest$p.value > alpha,1,2) 
      
      
      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }
      
      #The effect size is phi (sqrt(chi/n))
      
      effect_size<-round(sqrt(chi_value/total),3)
      
      
      param<-list(alpha=alpha,n=total, vsize=vsize, observed = observed, expected = expected_freq, contrib_cell=round(cell_contrib,3) , chi=chi_value, df=df, p=p_value, pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, e_size=effect_size)  
      
      
    }else if(test=="rsum"){
      
      
      hig_low_dif<-sample(c("lower","higher","different"), size=1)
      
      n1<-sample(x=5:8, size=1)
      n2<-n1+sample(x=-1:1,1)#sample(x=5:8, size=1)
      alpha<-sample(x=c(0.01,0.05),size=1)
      
      mean1<-sample(170:240, size=1)
      mean2<-sample(170:240, size=1)
      s1<-runif(n=1,min=1.25,max=8)#variance
      s2<-runif(n=1, min=s1-1,max = s1+1)#variance
      
      sample1<-round(rnorm(n=n1, mean=mean1, sd=sqrt(s1)))
      
      #df<-(((s1/n1)+(s2/n2))^2)/((((s1/n1)^2)/(n1-1))+(((s2/n2)^2)/(n2-1)))
      
      
      sample2<-round(rnorm(n=n2, mean=mean2, sd=sqrt(s2)))
      
      
      mean_s1<-mean(sample1)
      sd_s1<-sd(sample1)
      mean_s2<-mean(sample2)
      sd_s2<-sd(sample2)
      
      
      
      if(hig_low_dif=="lower"){
        type<-"less"
        hig_low_dif_text<-"lower than"
      }else if(hig_low_dif=="higher"){
        type<-"greater"
        hig_low_dif_text<-"higher than"
      }else if(hig_low_dif=="different"){
        type<-"two.sided"
        hig_low_dif_text<-"different from"
      }
      
      w_results<-wilcox.test(x=sample1, y=sample2, conf.level = (1-alpha), alternative = type)
      
      w_value<-w_results$statistic
      p_value<-w_results$p.value
      
      
      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }
      
      
      decision<-ifelse(p_value > alpha,1,2) 
      
      #efSize<-t_value^2/(t_value^2 + df)#abs(mean_s1-mean_s2)/se    #use cohensD function?
      
      
      param<-list(alpha=alpha, n1=n1, n2=n2, sample1= sample1, sample2=sample2, mean1= round(mean_s1,digits = 3), sd1= round(sd_s1,digits = 3), mean2= round(mean_s2,digits = 3), sd2= round(sd_s2,digits = 3), W=round(w_value,digits = 3), 
                  p=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, hig_low_dif=hig_low_dif_text)
      
      
      
      
      
      
      
    }else if(test=="srank"){
      hig_low_dif<-sample(c("lower","higher","different"), size=1)
      #zero_mean<-rbinom(n=1,size=1,prob=0.5)
      stdText<-""

      # if(zero_mean){
      #   meanH0<-0
      #   stdText<-"standarized "
      # }else{
      meanH0<-0 #sample(160:180, size=1)
      # }

      n<-sample(x=5:8, size=1)

      alpha<-sample(x=c(0.01,0.05),size=1)
      

      if(hig_low_dif=="lower"){
        ct<-floor(100*qt(alpha,df))/100
      }else if(hig_low_dif=="higher"){
        ct<-floor(100*qt(1-alpha,df))/100
      }else if(hig_low_dif=="different"){
        sign<-sample(x=c(-1,1), size = 1)
        if(sign==-1){
          ct<-sign*floor(100*qt((1-alpha)/2,df))/100
        }else{
          ct<-sign*floor(100*qt((alpha/2),df))/100
        }

      }


      #ct<- -qt(alpha,df) #critical t value

      s<-runif(n=1,min=4,max=8)

      mean_diff<-(ct*s/sqrt(n))+meanH0

      diff<-round(rnorm(n=n, mean=mean_diff, sd=s))

      m1<-sample(x=250:380, size=1)

      sample1<-rnorm(n=n, mean=m1, sd=s)

      # mean_1<-mean(sample1)
      # sd_1<-sd(sample1)

      sample2<-rnorm(n=n, mean = m1+mean_diff, sd=s)

      # mean_2<-mean(sample2)
      # sd_2<-sd(sample2)

      sample_diff<-sample1-sample2

      mean_1<-mean(sample_diff)
      sd_1<-sd(sample_diff)

      se<-sd_1/sqrt(n)

      if(hig_low_dif=="lower"){
        type<-"less"
        hig_low_dif_text<-"lower than"
      }else if(hig_low_dif=="higher"){
        type<-"greater"
        hig_low_dif_text<-"higher than"
      }else if(hig_low_dif=="different"){
        type<-"two.sided"
        hig_low_dif_text<-"different from"
      }

      w_test<-wilcox.test(sample_diff, mu=meanH0, conf.level = (1-alpha), alternative = type)

      w_value<-w_test$statistic
      p_value<-w_test$p.value

      #p_value intervals

      if(alpha==0.01){
        pval1<-"p > 0.01"
        pval2<-"0.01 &ge; p &ge; 0.005"
        pval3<-"0.005 > p &ge; 0.001"
        pval4<-"p < 0.001"
        if(p_value > 0.01){
          pval_button<-1
        }else if((0.01 >= p_value) && (p_value >= 0.005)){
          pval_button<-2
        }else if((0.005 > p_value) && (p_value >= 0.001)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }else if(alpha==0.05){
        pval1<-"p > 0.05"
        pval2<-"0.05 &ge; p &ge; 0.025"
        pval3<-"0.025 > p &ge; 0.01"
        pval4<-"p < 0.01"
        if(p_value > 0.05){
          pval_button<-1
        }else if((0.05 >= p_value) && (p_value >= 0.025)){
          pval_button<-2
        }else if((0.025 > p_value) && (p_value >= 0.01)){
          pval_button<-3
        }else{
          pval_button<-4
        }
      }


      decision<-ifelse(p_value > alpha,1,2)


      param<-list(alpha=alpha, mu=meanH0, n=n, sample1= sample1, sample2=sample2, diff=sample_diff, mean= round(mean_1,digits = 3), sd= round(sd_1,digits = 3), se= round(se,digits = 3), W=round(w_value,digits = 3),
                  p=round(p_value,digits = 3), pval1=pval1, pval2=pval2, pval3=pval3, pval4=pval4, pval_button=pval_button, decision=decision, stdText= stdText, hig_low_dif=hig_low_dif_text)


    }
  
  
  
  
  
  return(param)
  
  
}











sign22<-function(sign11,sign12,sign21){
  
  if(sign11==-1){
    
    if(sign12==1){
      if(sign21==1){
        sign22<-0
      }else if(sign21==0){
        sign22<-(-1)
      }
    }else if(sign12==0){
      if(sign21==1){
        sign22<-(-1)
      }else if(sign21==0){
        sign22<-1
      }
    }
    
    
    
  }else if(sign11==0){
    
    if(sign12==1){
      if(sign21==1){
        sign22<-(-1)
      }else if(sign21==-1){
        sign22<-0
      }
    }else if(sign12==-1){
      if(sign21==1){
        sign22<-0
      }else if(sign21==-1){
        sign22<-1
      }
    }
    
    
    
  }else if(sign11==1)
    
    if(sign12==-1){
      if(sign21==-1){
        sign22<-0
      }else if(sign21==0){
        sign22<-1
      }
    }else if(sign12==0){
      if(sign21==-1){
        sign22<-1
      }else if(sign21==0){
        sign22<-(-1)
      }
    }
  
  
  
  return(sign22)
  
  
}