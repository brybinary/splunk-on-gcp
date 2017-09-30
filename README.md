```### splunk on GCP: deploy clustered splunk to GCP using terraform and ansible```

* basic deployment and will progress to include dynamic inventory collection, better tagging and extend to multi-site, multi-az & multi-region
* my OS is MAC (El Capitan 10.11.6)

### pre-req's & assumptions
* gcp account and json keyfile available
* ansible configured locally
* terraform configured locally
* an understanding of setting up your terraform & ansible env's

### initial inspirations (for terraform)
https://sevagh.github.io/post/gcp/

### TERRAFORM (commands used):
`you can amend 'splunk.tf' and change name to suit your req's`

`you can amend variables.tf - e.g. region, account_file, zone, tags etc (I used the tags to effectively target the ansible builds [probably not pretty and I will look to streamline that with better dynamic inventory creation])`
* terraform plan
* terraform apply
* terraform destroy

### ANSIBLE (commands used):
* ansible-playbook splunk-gcp-build-all.yml
* ansible-playbook splunk-remove-all.yml

## Updates & Further works.
I shall continue to develop this as and when (it is something I am also doing on the day job, so am hoping fairly regular updates).
* dynamic inventory
* multi-everything
* bolting splunk storage (for index cluster) onto buckets [likely via an hadoop cluster]
* sso/2fa/ldap auth for search head web ui access
* further build-out of load balancer access and firewall configs
* blue/green modelling
* & more

```please for fork, add your own logic (and improve mine!) and request pulls as I would certainly appreciate comments, feedback and improvements to this repo :-)```
