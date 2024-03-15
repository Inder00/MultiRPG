txd = engineLoadTXD("streed.txd")
engineImportTXD(txd, 400)
dff = engineLoadDFF("streed.dff", 437)
engineReplaceModel(dff, 400)

-- generated with http://mta.dzek.eu/