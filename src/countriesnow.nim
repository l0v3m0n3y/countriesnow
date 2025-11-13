import asyncdispatch, httpclient, json, strutils, uri

const api = "https://countriesnow.space/api/v0.1"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "countriesnow.space",
    "Accept": "application/json",
    "Content-Type": "application/json"
})

# Получить данные о населении города
proc get_city_population*(city: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"city": city}
    let response = await client.post(api & "/countries/population/cities", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Фильтрация городов по стране с параметрами
proc filter_cities*(
    country: string = "",
    limit: int = 10,
    order: string = "asc",
    orderBy: string = "name"
): Future[JsonNode] {.async.} =
  
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{
      "country": country,
      "limit": limit,
      "order": order,
      "orderBy": orderBy
    }
    let response = await client.post(api & "/countries/population/cities/filter", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Дополнительные процедуры для CountriesNow API

# Получить все страны
proc get_countries*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/countries")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

# Получить города страны
proc get_country_cities*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/cities", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Получить население страны
proc get_country_population*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/population", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Получить информацию о валюте страны
proc get_country_currency*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/currency", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Получить позицию страны (координаты)
proc get_country_position*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/positions", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Получить коды ISO страны
proc get_country_codes*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/codes", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()

# Получить флаг страны
proc get_country_flag*(country: string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let body = %*{"country": country}
    let response = await client.post(api & "/countries/flag", $body)
    let responseBody = await response.body
    result = parseJson(responseBody)
  finally:
    client.close()
