#!/usr/bin/env python
import cdsapi
c = cdsapi.Client()
c.retrieve('reanalysis-era5-complete', {
  'date'    : 'yyy-mm-dd',
  'levelist': '1/to/137/by/1',
  'levtype' : 'ml',
  'param'   : '75/76/77/129/130/131/132/133/135/138/152/155/203/246/247/248',
  'stream'  : 'oper',
  'time'    : '00/to/23/by/1',
  'type'    : 'an',
  'area'    :
  'grid'    : '0.25/0.25',
  'format'  : 'grib',
}, 'an19880802_ml.grib')
