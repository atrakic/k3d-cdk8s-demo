#!/usr/bin/env python3
from constructs import Construct
from cdk8s import App, Chart
from lib.webservice import WebService


class MyChart(Chart):
    def __init__(self, scope: Construct, ns: str):
        super().__init__(scope, ns)

        WebService(self, "hello", image="paulbouwer/hello-kubernetes:1.7", replicas=2)


app = App()
MyChart(app, "hello")

app.synth()
