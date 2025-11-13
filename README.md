# countriesnow
api for countriesnow.space info about countries and cities

# Example
```nim
import asyncdispatch, countriesnow , json, strutils
let lagos = waitFor get_city_population("lagos")
echo lagos
```

# Launch (your script)
```
nim c -d:ssl -r  your_app.nim
```
