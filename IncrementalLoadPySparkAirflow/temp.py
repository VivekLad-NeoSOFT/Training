from nsepython import nsefetch

try:
    url = "https://www.nseindia.com/api/equity-stockIndices?index=NIFTY%2050"
    data = nsefetch(url)
    timestamp = data.get('timestamp')
    chart = data.get('data')
    print(chart)
except Exception as e:
    print(f"Error fetching data: {e}")

data = {'timestamp': timestamp, 'data': chart}
flattern = []
if data.get('timestamp') and data.get('data'):
    for row in data.get('data', {}):
        if row.get('priority') == 0:
            new_row = {}
            new_row['symbol'] = row.get('symbol')
            new_row['identifier'] = row.get('identifier')
            new_row['open'] = row.get('open')
            new_row['dayHigh'] = row.get('dayHigh')
            new_row['dayLow'] = row.get('dayLow')
            new_row['lastPrice'] = row.get('lastPrice')
            new_row['previousClose'] = row.get('previousClose')
            new_row['change'] = row.get('change')
            new_row['pChange'] = row.get('pChange')
            new_row['totalTradedVolume'] = row.get('totalTradedVolume')
            new_row['totalTradedValue'] = row.get('totalTradedValue')
            new_row['yearHigh'] = row.get('yearHigh')
            new_row['yearLow'] = row.get('yearLow')
            new_row['companyName'] = row.get('meta').get('companyName')
            new_row['industry'] = row.get('meta').get('industry')
            new_row['listingDate'] = row.get('meta').get('listingDate')
            new_row['timestamp'] = data.get('timestamp')
            flattern.append(new_row)
