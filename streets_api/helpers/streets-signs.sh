#!/bin/bash

gimp -i -b '(script-fu-streets-signs "'$1'" "'$2'")' -b '(gimp-quit 0)'
