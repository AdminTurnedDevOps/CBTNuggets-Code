import azure.functions as function
import os

def main(req: function.HttpRequest) -> function.HttpResponse:
    print('Running Requests Function...')

    host1 = os.system("ping -c 2 8.8.8.8")
    host2 = os.system("ping -c 2 8.8.4.4")

    if host1 == 0 and host2 == 0:
        return function.HttpResponse(
            "ALL SYSTEMS UP"
        )
    else:
        return function.HttpResponse(
             "No good!",
             status_code=400
        )