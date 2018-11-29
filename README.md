# consuldiscovery
Auto service discovery using consul

I have added to Dockerfiles one for postgres and the other for Django.
Django build is using the context.

I have installed dnspython package in the django conatiner for resolving the dns with consul.

I have made changed to the docker-entrypoint.sh file, where I have included postgres-init and consul-agent.sh scripts to run along with it.

There are little modifications to be done to work completely.
