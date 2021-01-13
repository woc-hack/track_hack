# Tracking Hackathon Code Usage
Replication Package for "The Secret Life of Hackathon Code Where does it come from and where does it go?"

# Data Processing Steps Listed below using [WoC](https://github.com/woc-hack/tutorial):

Command for getting required data from WoC

###  Get Project to Commit maps (p2c):
`$ cat hack_projects | ~/lookup/getValues -f p2c > p2c.csv`

###  Get Commit to Blob maps (c2b):
`$ cat p2c.csv | cut -d\; -f2 | sort -u | ~/lookup/getValues -f c2b > c2b.csv`

###  Get Blob to Author maps (b2a):
`$ cat c2b.csv | cut -d\; -f2 | sort -u > Bs`
`$ cat Bs | ~/lookup/getValues -f b2a | awk -F\; '{OFS=";"; $2=strftime("%Y-%m-%d %H:%M:%S", $2); print $0}' > b2a.csv`

###  Get Project to author maps (p2a):
`$ cat hack_projects | ~/lookup/getValues p2a | sed -e 's/;/,/g' -e 's/,/;/1' > p2a.csv`


## [Analysis for identifying when and by whom the code was created (RQ1)](./TrackCodeGeneration.ipynb)
## [Analysis for tracking hackathon code reuse (RQ2)](./TrackCodeUsage.ipynb)
