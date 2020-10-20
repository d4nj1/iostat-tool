PACKAGE_NAME = 'iostat-tool'

# parser options
SUB_COMMAND_CSV = 'csv'
SUB_COMMAND_MONITOR = 'monitor'
SUB_COMMAND_PLOT = 'plot'

# plot options
PLOT_TYPE_PLOTTER = 'plotter'
PLOT_TYPE_SCATTER = 'scatter'
PLOT_TYPES = [
    PLOT_TYPE_PLOTTER,
    PLOT_TYPE_SCATTER,
]

# device subplots parameters
IO_RQM = 'io_rqm'
IOPS = 'iops'
IO_TRANSFER = 'io_transfer'
PERCENT_UTIL = '%util'
AVGRQ_SZ = 'avgrq-sz'
AREQ_SZ = 'areq-sz'     # new name for AVGRQ_SZ but kilobytes instead of sectors
AVGQU_SZ = 'avgqu-sz'
AQU_SZ = 'aqu-sz'       # new name for AVGQU_SZ
AWAIT = 'await'

DEVICE_SUBPLOTS = [
    IO_RQM, IOPS, IO_TRANSFER, PERCENT_UTIL,
    AVGRQ_SZ, AREQ_SZ, AVGQU_SZ, AQU_SZ, AWAIT
]
