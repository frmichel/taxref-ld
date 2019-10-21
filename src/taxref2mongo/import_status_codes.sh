#!/bin/bash

db=taxrefv12

mongo localhost/$db import_status_codes.js
