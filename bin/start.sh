#!/bin/sh

bin/linkir eval "Linkir.ReleaseTasks.migrate()"

bin/linkir start
