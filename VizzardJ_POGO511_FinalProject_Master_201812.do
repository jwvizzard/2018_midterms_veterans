*James W. Vizzard
*POGO 511 Section 001
*December 17, 2018
*Final Project Do File

*Data Sources:

*Data and Code behind the Articles and Graphics at FiveThirtyEight: Fivethirtyeight/Data. Jupyter Notebook. 2014. Reprint, FiveThirtyEight, 2018. https://github.com/fivethirtyeight/data.


use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/candidates_ushr_2018.dta" , clear

*Clean data

**Democratic candidates

***remove failed candidates

drop if primarystatus == 2

drop if primaryrunoffstatus == 2

***remove races other than House of Representatives

encode (officetype) , gen (officetype_num) 

drop officetype

rename officetype_num officetype

la define officetypelab 1 "Governor" 2 "Representative" 3 "Senator"

la val officetype officetypelab

desc officetype

drop if officetype == 1

drop if officetype == 3

***Convert string variables to a numeric variables

encode (primarystatus) , gen (primarystatus_num) 

drop primarystatus

rename primarystatus_num primarystatus

la define primarystatuslab 2 "Lost" 1 "Advanced"

la val primarystatus primarystatuslab

encode (primaryrunoffstatus) , gen (primaryrunoffstatus_num) 

drop primaryrunoffstatus

rename primaryrunoffstatus_num primaryrunoffstatus

la define primarystatuslab 2 "Lost" 1 "Advanced"

la val primarystatus primarystatuslab

encode (veteran) , gen (veteran_num)

drop veteran

rename veteran_num veteran

encode (lgbtq) , gen (lgbtq_num)

drop lgbtq

rename lgbtq_num lgbtq

encode (electedofficial) , gen (electedofficial_num)

drop electedofficial

rename electedofficial_num electedofficial

encode (race) , gen (race_num)

drop race

rename race_num race

encode (votevetsendorsed) , gen (votevetsendorsed_num)

drop votevetsendorsed

rename votevetsendorsed_num votevetsendorsed

***Delete unnecessary Democrat variables

drop generalstatus

drop racetype

drop wonprimary

drop bidenendorsed

drop sandersendorsed

drop emilyendorsed

drop gunsensecandidate

drop indivisibleendorsed

drop justicedemsendorsed

drop nolabelssupport

drop ourrevolutionendorsed

drop selffunder

drop stem

drop warrenendorsed

drop wfpendorsed

drop pcccendorsed

drop partysupport

drop obamaalum

drop primaryrunoffstatus

drop primarystatus

drop officetype

drop state

drop generalstatus

drop racetype

drop wonprimary

drop primary

drop officetype

***Create necessary variables

gen int party = 1

la define partylab 1 "Democrat" 2 "Republican"

la val party partylab

label variable party `"political party"'




**Republican candidates

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/candidates_ushr_gop_2018.dta" , clear

***Convert string variables to a numeric variables

encode (primarystatus) , gen (primarystatus_num) 

drop primarystatus

rename primarystatus_num primarystatus

la define primarystatuslab 2 "Lost" 1 "Advanced"

la val primarystatus primarystatuslab

desc primarystatus

encode (primaryrunoffstatus) , gen (primaryrunoffstatus_num) 

drop primaryrunoffstatus

rename primaryrunoffstatus_num primaryrunoffstatus

la define primarystatuslab 2 "Lost" 1 "Advanced"

la val primarystatus primarystatuslab


***remove failed candidates

drop if primarystatus == 2

drop if primaryrunoffstatus == 2


***remove races other than House of Representatives

encode (officetype) , gen (officetype_num) 

drop officetype

rename officetype_num officetype

la define officetypelab 1 "Governor" 2 "Representative" 3 "Senator"

la val officetype officetypelab

desc officetype

drop if officetype == 1

drop if officetype == 3


***Delete unnecessary Republican variables

drop generalstatus

drop racetype

drop wonprimary

drop primarystatus

drop primaryrunoffstatus

drop officetype

drop trumpendorsed

drop bannonendorsed

drop reppartysupport

drop greatamericaendorsed

drop nraendorsed

drop raceprimaryelectiondate

drop righttolifeendorsed

drop susanbanthonyendorsed

drop primary

drop clubforgrowthendorsed

drop state

drop kochsupport

drop housefreedomsupport

drop teapartyendorsed

drop mainstreetendorsed

drop chamberendorsed

drop nolabelssupport


***Generate necessary variables

gen partisanlean float = .

gen veteran long = .

gen lgbtq long = .

gen race long = .

gen votevetsendorsed long = .

gen party int = 2



***Convert string variables to a numeric variables

encode (reppartysupport) , gen (reppartysupport_num) 

drop reppartysupport

rename reppartysupport_num reppartysupport


encode (trumpendorsed) , gen (trumpendorsed_num) 

drop trumpendorsed

rename trumpendorsed_num trumpendorsed

encode (bannonendorsed) , gen (bannonendorsed_num) 

drop bannonendorsed

rename bannonendorsed_num bannonendorsed

encode (greatamericaendorsed) , gen (greatamericaendorsed_num) 

drop greatamericaendorsed

rename greatamericaendorsed_num greatamericaendorsed

encode (nraendorsed) , gen (nraendorsedendorsed_num) 

drop nraendorsed

rename nraendorsedendorsed_num nraendorsed

encode (righttolifeendorsed) , gen (righttolifeendorsed_num) 

drop righttolifeendorsed

rename righttolifeendorsed_num righttolifeendorsed

encode (susanbanthonyendorsed) , gen (susanbanthonyendorsed_num) 

drop susanbanthonyendorsed

rename susanbanthonyendorsed_num susanbanthonyendorsed

encode (clubforgrowthendorsed) , gen (clubforgrowthendorsed_num) 

drop clubforgrowthendorsed

rename clubforgrowthendorsed_num clubforgrowthendorsed

encode (kochsupport) , gen (kochsupport_num) 

drop kochsupport

rename kochsupport_num kochsupport

encode (housefreedomsupport) , gen (housefreedomsupport_num) 

drop housefreedomsupport

rename housefreedomsupport_num housefreedomsupport

encode (teapartyendorsed) , gen (teapartyendorsed_num) 

drop teapartyendorsed

rename teapartyendorsed_num teapartyendorsed

encode (mainstreetendorsed) , gen (mainstreetendorsed_num) 

drop mainstreetendorsed

rename mainstreetendorsed_num mainstreetendorsed

encode (chamberendorsed) , gen (chamberendorsed_num) 

drop chamberendorsed

rename chamberendorsed_num chamberendorsed

encode (nolabelssupport) , gen (nolabelssupport_num)

drop nolabelssupport

rename nolabelssupport_num nolabelssupport

**Veteran status

***Veteran status for GOP candidates
encode (veteran) , gen (veteran_num)

drop veteran

rename veteran_num veteran

***Add veterans data by CD

gen int vet1764:vet1764 = .

lab var vet1764 "vet1764"

gen int vet65:vet65 = .

lab var vet65 "vet65"

gen int vetpop:vetpop = .

lab var vetpop "vetpop"

****Import population and veteran data into Democrat dataset

****Import population and veteran data into Republican dataset

**Combine Democrat and Republican datasets

append using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/candidates_ushr_gop_2018.dta"

*******USING FiveThirtyEight dataset downloaded 27 October

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/VizzardJ_Pogo511_FinalProject_Master_201812.dta" , clear

**convert string dates to numeric dates

gen forecastdate2 = date(forecastdate, "YMD")
format forecastdate2 %td

drop forecastdate

gen diststring = district

tostring diststring , replace 

gen districtlong = state + diststring

drop diststring

lab var forecastdate2 "Numeric Date"

lab var districtlong "District Long"

bysort candidate forecastdate2 : gen seq=_n

bysort candidate forecastdate2 : gen max=_N

mark keep if seq==max

encode (model), gen (model_num)

drop model

rename model_num model

drop if model == 2

drop if model == 3

drop if keep == 0

drop keep

drop seq

drop max

bysort candidate forecastdate2 : gen seq=_n

bysort candidate forecastdate2 : gen max=_N

mark keep if seq==max

duplicates drop candidate , force 

drop special

sort districtlong

encode (incumbent), gen (incumbent_num)

drop incumbent

rename incumbent_num incumbent

***Drop unnecessary variables

drop seq

drop max

drop keep

drop win_probability

drop model

drop voteshare

drop p10_voteshare

drop p90_voteshare

drop partisanlean

drop _merge

drop veteran

drop sex

***Merge Cook Political Report Partisan Voter Index into dataset

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/VizzardJ_Pogo511_FinalProject_Master_201812.dta" , clear

merge m:1 districtlong using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/CPR_PVI_20181028.dta"

***Enter veteran status from WithHonor.com

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/WH_Vets_20181028.dta" , clear

****Took the opportunity to enter sex for the veterans while I was cleaning up the table

label define sexlabel 1 "Male" 2 "Female" 

label val sex sexlabel

gen byte veteran =1

merge 1:1 candidate using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/WH_Vets_20181028.dta"

gen majpart = 1 if (party == "R" | party == "D")

drop if majpart ==.

drop majpart

drop _merge

encode (party), gen (party_num)

drop party

rename party_num party

replace veteran = 0 if (veteran == .)

label define veteranlabel 0 "No" 1 "Yes" 

label variable veteran `"veteran"'

gen float r_vote = .

label variable r_vote `"r_vote"'

gen float d_vote = .

label variable d_vote `"d_vote"'

gen float final_vote = (r_vote - d_vote)

merge m:1 districtlong using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/VA_VetDatabyCD_20181028.dta"

drop _merge

tab sex (veteran)

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/CPR_PVI_20181028.dta"

**Create a merge variable to merge the results data

decode party, gen(party_alpha)

gen merge = districtlong + party_alpha

**Merge in results as of November 25, 2018

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/VizzardJ_Pogo511_FinalProject_Master_201812.dta" , clear

merge 1:1 merge using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/WassermanD_2018HousePopularVoteTracker_20181125.dta"

**adjust decimal in the PVI

gen cook_pvi = pvi/100

drop pvi

**Generate a dummy variable for party lean

gen lean_dummy = 2

replace lean_dummy = 1 if cook_pvi < 0

label variable lean_dummy `"lean_dummy"'

label define lean_dummy_label 1 "D" 2 "R" 

**Measure over- or under-performance

gen performance = r_differential - cook_pvi

**Identify duplicate merge variables

use "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/WassermanD_2018HousePopularVoteTracker_20181125.dta" , clear

duplicates tag merge, gen(dups)

drop if vote == .

**drop unopposed candidates

drop if percentage == 1

**generate interaction terms for female veterans and democratic veterans

tab sex, nol

tab party, nol

tab veteran, nol

gen vet_sex = veteran * sex

label define vet_sex 0 "Non Vet" 1 "Male Vet" 2 "Female Vet"

label variable vet_sex `"VetXSex"'

gen veteran_party = veteran * party

label define veteran_party 0 "Non Vet" 1 "Dem Vet" 2 "Rep Vet"

gen vet_female = 0

replace vet_female = 1 if vet_sex == 2

label variable vet_female `"vet_female"'

label define vet_female_label 1 "yes" 0 "no" 

gen party_match = 0

replace party_match = 1 if lean_dummy==party

label variable party_match "party_match"

label define party_match 1 "Yes" 2 "No"


**Import campaign finance information

drop _merge

merge 1:1 merge using "/home/james/Documents/Drive/James/201801-20YYMM_PhD/POGO511_Statistics/work/data/analysis/FEC_finance_2017-2018_20181205.dta"

drop candidate_confirm

gen support = ind_contrib + other_committee_contrib + party_committee_contrib

lab variable support `"contributions_rcvd"'

gen performance_adj = performance * -1

replace performance_adj = performance if party == 2




*Hypothesis testing of independent variables

**Independent variables across the entire population

ttest performance_adj, by (incumbent)

ttest performance_adj, by (party_match)

ttest performance_adj, by (veteran)

ttest performance_adj, by (sex)

ttest performance_adj, by (vet_female)

ttest performance_adj if vet_sex != 0, by (vet_sex) 

***Correlation of candidate contributions and spending with performance

corr performance_adj support

corr performance_adj op_expenditure

twoway scatter performance_adj support || lfit performance_adj support, ytitle(Peformance) xtitle($ Support) title(Electoral Peformance by $ raised)

twoway scatter performance_adj op_expenditure || lfit performance_adj support, ytitle(Peformance) xtitle($ Spent) title(Electoral Peformance by $ spent)

**Neutral-to-Republican-leaning districts

***Democratic veterans in R+ districts

ttest performance_adj if party == 1 | cook_pvi >= 0, by (veteran)

***Female veterans in R+ districts v. other female Democrats

ttest performance_adj if party == 1 | cook_pvi >= 0 | sex  == 2, by (vet_female)

***Female veterans in R+ v. all Democrats

ttest performance_adj if party == 1 | cook_pvi >= 0, by (vet_female)

***Democratic candidate sex in R+ districts

ttest performance_adj if party == 1 | cook_pvi >= 0, by (sex)

**Democratic-leaning districts

***Democratic veterans in D+ districts

ttest performance_adj if party == 1 | cook_pvi < 0, by (veteran) 

***Female veterans in D+ v. all Democrats

ttest performance_adj if party == 1 | cook_pvi < 0, by (vet_female)

***Democratic candidate sex in D+ districts

ttest performance_adj if party == 1 | cook_pvi < 0, by (sex)




*Regression analyses



**Total population

regress performance_adj party_match incumbent veteran sex vet_sex support op_expenditure


**Neutral-to-Republican-leaning districts

***All candidates, R+ districts

regress performance_adj party_match incumbent veteran support op_expenditure if cook_pvi >= 0

***Democrats, R+ districts

regress performance_adj veteran support op_expenditure if party == 1 | cook_pvi >= 0 

***Democratic women veterans, neutral-to-Republican-leaning districts

regress performance_adj veteran sex vet_female support op_expenditure if party == 1 |cook_pvi >= 0

***Democratic women vets v. non-vets, R+ districts

regress performance_adj veteran support op_expenditure if sex == 2 | party == 1 |cook_pvi >= 0

**Democratic-leaning districts

***All candidates, D+ districts

regress performance_adj party_match incumbent veteran sex vet_female support op_expenditure if cook_pvi < 0

***Democratic women

regress performance_adj party_match incumbent veteran support op_expenditure if sex == 2 | party == 1 | cook_pvi < 0 

*Democratic men, D+ districts

regress performance_adj party_match incumbent veteran support op_expenditure if sex == 1 | party == 1 | cook_pvi < 0 

*Miscellaneous

tab candidate veteran if party == 1 

count if party == 1 & veteran == 1 




