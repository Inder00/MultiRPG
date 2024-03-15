txd = engineLoadTXD("copcarsf.txd")
engineImportTXD(txd, 597)
dff = engineLoadDFF("copcarsf.dff", 597)
engineReplaceModel(dff, 597)

-- generated with http://mta.dzek.eu/