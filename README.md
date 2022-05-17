# js-polyfill-docker

> 🐳Docker container for the polyfill.io service to serve JavaScript bundles per browser efficiently.

## Build

Clone this repository and build the image:

```bash
docker build . -t js-polyfill-docker
```

## Run

After this just run the container and bind the port with

```bash
docker run js-polyfill-docker -p 8801:8801
```

## iFixit Usage
We use this on ifixit.com for our javascript polyfills.

In order to update our docker image:
1. Log in to `ecr-public`:
```
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
```
1. Tag the freshly built docker image:
```
docker tag <new image id> public.ecr.aws/s0h8b9s4/js-polyfill-docker:<VERSION_TAG>
```
1. Push to ECR:
```
docker push public.ecr.aws/s0h8b9s4/js-polyfill-docker:<VERSION_TAG>
```
1. Update the version tag in `server-templates`:
https://github.com/iFixit/server-templates/blob/a13f1b273b42c6f61a57806bf38ad0202a1c6384/shared/scripts/launch-polyfill-service#L8


## Resources

The official [polyfill.io](https://polyfill.io/v2/docs/) service maintained by the [Financial Times team](https://github.com/Financial-Times/).

## Contributors

<table><thead><tr><th align="center"><a href="https://github.com/fvj"><img src="https://avatars0.githubusercontent.com/u/4746806?v=4" width="100px;" style="max-width:100%;"><br><sub>fvj</sub></a><br></th><th align="center"><a href="https://github.com/igeligel"><img src="https://avatars1.githubusercontent.com/u/12736734?v=4" width="100px;" style="max-width:100%;"><br><sub>igeligel</sub></a><br></th></tbody></table>

## License

*js-polyfill-docker* is realeased under the [MIT License](./LICENSE).
