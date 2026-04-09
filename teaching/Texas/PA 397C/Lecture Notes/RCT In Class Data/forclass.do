

cd "C:\Users\jtd757\Desktop\"
use socsec_data.dta

gen treat=(treatgroup==1)

gen paid_work_yes = paid_work==1 if paid_work<. & paid_work~=-1
label var paid_work_yes "Did any paid work in the past month"


reg paid_work_yes treat
sum paid_work_yes if treat==1
sum paid_work_yes if treat==0
ttest paid_work_yes, by(treat)