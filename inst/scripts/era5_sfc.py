##!/usr/bin/env python
import cdsapi
c = cdsapi.Client()
c.retrieve('reanalysis-era5-complete', {
    'class'  : 'ea',
    'date'   : 'DATE',
    'expver' : '1',
    'levtype': 'sfc',
    'param'  : 'VARS',
    'stream' : 'oper',
    'time'   : 'TIME',
    'type'   : 'an',
    'format'  : 'FORMAT',
    'area'    : AREA,
    'grid'    : 'RES',  
}, 'FILENAME')

