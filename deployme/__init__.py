from klein import run, route

@route('/')
def home(request):
    request.setHeader("content-type", "text/plain")
    return 'Hello, world!'

def main():
    run("", 8081)
