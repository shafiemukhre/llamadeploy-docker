
## Setup

1. Duplicate `.env.sample` file, rename it to `.env` and fill up the values.
2. `pipenv install -r requirements.txt`
3. `pipenv shell`

## Running workflow python script (standalone)

- `pipenv run python src/workflow.py` should return correctly output

```
Based on the provided context, the following LLCs are listed as defendants in the lawsuit:

1. OpenAI, L.L.C.
2. OpenAI OpCo, LLC
3. OpenAI Global, LLC
4. OAI Corporation, LLC
5. OpenAI Holdings, LLC
6. Aestas Management Company, LLC
7. Aestas, LLC
8. OpenAI Investment LLC
9. OpenAI Startup Fund Management, LLC
10. OpenAI Startup Fund GP I, L.L.C.
11. OpenAI Startup Fund SPV GP I, L.L.C.
12. OpenAI Startup Fund SPV GP II, L.L.C.
13. OpenAI Startup Fund SPV GP III, L.L.C.
14. OpenAI Startup Fund SPV GP IV, L.L.C.

Note that Elon Musk is not mentioned as a plaintiff in the provided context. The lawsuit appears to be filed by OpenAI, L.P. against the listed defendants.
```

## Running api server locally

```
$ pipenv run python -m llama_deploy.apiserver
Loading .env environment variables...
INFO:     Started server process [55238]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:4501
```

Create a new terminal tab and run 

```
$ llamactl deploy deployment.yaml
Deployment successful: QuickStart
```

```
$ llamactl run --deployment QuickStart --arg query_str "List all LLCs that Elon Musk is suing"
Based on the provided context, the LLCs that Elon Musk is suing are:

1. OpenAI Investment LLC
2. Aestas Management Company, LLC
3. Aestas, LLC 

These are listed as defendants in the lawsuit.
```

## Running the api server using docker locally

```
$ docker run -p 4501:4501 -v .:/opt/quickstart -w /opt/quickstart llamaindex/llama-deploy:main
INFO:     Started server process [1]
INFO:     Waiting for application startup.
INFO:     Application startup complete.
INFO:     Uvicorn running on http://0.0.0.0:4501
```

Go to docker, click exec and run `pip install -r requirements.txt`

Create a new terminal tab and run `llamactl deploy deployment.yaml` 


