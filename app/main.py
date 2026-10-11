from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def home():
    return {"message": "Python CI/CD deployed successfully"}


@app.get("/add")
def add(a: int, b: int):
    return {"result": a + b}