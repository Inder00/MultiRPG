txd = engineLoadTXD("599.txd")
engineImportTXD(txd, 599)
dff = engineLoadDFF("599.dff", 599)
engineReplaceModel(dff, 599)

-- generated with http://mta.dzek.eu/