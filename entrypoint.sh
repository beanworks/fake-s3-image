#!/bin/sh

tar -C /fakes3_root -xvf /fake-s3/fixtures.tar

/fake-s3/bin/fakes3 -r /fakes3_root -p 4569
