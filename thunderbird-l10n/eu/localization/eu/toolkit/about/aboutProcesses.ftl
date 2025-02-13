# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Page title
about-processes-title = Prozesuen kudeatzailea
# The Actions column
about-processes-column-action =
    .title = Ekintzak

## Tooltips

about-processes-shutdown-process =
    .title = Deskargatu fitxak eta hil prozesua
about-processes-shutdown-tab =
    .title = Itxi fitxa
# Profiler icons
# Variables:
#    $duration (Number) The time in seconds during which the profiler will be running.
#                       The value will be an integer, typically less than 10.
about-processes-profile-process =
    .title =
        { $duration ->
            [one] Egin prozesu honetako hari guztien profila segundo batez
           *[other] Egin prozesu honetako hari guztien profila { $duration } segundoz
        }

## Column headers

about-processes-column-name = Izena
about-processes-column-memory-resident = Memoria
about-processes-column-cpu-total = PUZa

## Process names
## Variables:
##    $pid (String) The process id of this process, assigned by the OS.

about-processes-browser-process = { -brand-short-name } ({ $pid })
about-processes-web-process = Partekatutako web prozesua ({ $pid })
about-processes-file-process = Fitxategiak ({ $pid })
about-processes-extension-process = Gehigarriak ({ $pid })
about-processes-privilegedabout-process = Honi buruzko orriak ({ $pid })
about-processes-plugin-process = Pluginak ({ $pid })
about-processes-privilegedmozilla-process = { -vendor-short-name } guneak ({ $pid })
about-processes-gmp-plugin-process = Gecko multimedia pluginak ({ $pid })
about-processes-gpu-process = GPUa ({ $pid })
about-processes-vr-process = VR ({ $pid })
about-processes-rdd-process = Datuen deskodetzailea ({ $pid })
about-processes-socket-process = Sarea ({ $pid })
about-processes-remote-sandbox-broker-process = Urruneko isolamenduko artekaria ({ $pid })
about-processes-fork-server-process = Fork zerbitzaria ({ $pid })
about-processes-preallocated-process = Aurrez esleitutakoa ({ $pid })
# Unknown process names
# Variables:
#    $pid (String) The process id of this process, assigned by the OS.
#    $type (String) The raw type for this process.
about-processes-unknown-process = Bestelakoa: { $type } ({ $pid })

## Isolated process names
## Variables:
##    $pid (String) The process id of this process, assigned by the OS.
##    $origin (String) The domain name for this process.

about-processes-web-isolated-process = { $origin } ({ $pid })
about-processes-web-large-allocation-process = { $origin } ({ $pid }, handia)
about-processes-with-coop-coep-process = { $origin } ({ $pid }, jatorri gurutzatu isolatua)
about-processes-web-isolated-process-private = { $origin } — Pribatua ({ $pid })
about-processes-web-large-allocation-process-private = { $origin } — Pribatua ({ $pid }, handia)
about-processes-with-coop-coep-process-private = { $origin } — Pribatua ({ $pid }, jatorri gurutzatu isolatua)

## Details within processes

# Single-line summary of threads (non-idle process)
# Variables:
#    $number (Number) The number of threads in the process. Typically larger
#                     than 30. We don't expect to ever have processes with less
#                     than 5 threads.
#    $active (Number) The number of active threads in the process.
#                     The value will be greater than 0 and will never be
#                     greater than $number.
#    $list (String) Comma separated list of active threads.
#                   Can be an empty string if the process is idle.
about-processes-active-threads =
    { $active ->
        [one] { $number }/{ $active } hari aktibo: { $list }
       *[other] { $number }/{ $active } hari aktibo: { $list }
    }
# Single-line summary of threads (idle process)
# Variables:
#    $number (Number) The number of threads in the process. Typically larger
#                     than 30. We don't expect to ever have processes with less
#                     than 5 threads.
#                     The process is idle so all threads are inactive.
about-processes-inactive-threads =
    { $number ->
        [one] hari inaktibo bat
       *[other] { $number } hari inaktibo
    }
# Thread details
# Variables:
#   $name (String) The name assigned to the thread.
#   $tid (String) The thread id of this thread, assigned by the OS.
about-processes-thread-name-and-id = { $name }
    .title = Hariaren IDa: { $tid }
# Tab
# Variables:
#   $name (String) The name of the tab (typically the title of the page, might be the url while the page is loading).
about-processes-tab-name = Fitxa: { $name }
about-processes-preloaded-tab = Fitxa berria aurrez kargatuta
# Single subframe
# Variables:
#   $url (String) The full url of this subframe.
about-processes-frame-name-one = Azpimarkoa: { $url }
# Group of subframes
# Variables:
#   $number (Number) The number of subframes in this group. Always ≥ 1.
#   $shortUrl (String) The shared prefix for the subframes in the group.
about-processes-frame-name-many = Azpimarkoak ({ $number }): { $shortUrl }

## Displaying CPU (percentage and total)
## Variables:
##    $percent (Number) The percentage of CPU used by the process or thread.
##                      Always > 0, generally <= 200.
##    $total (Number) The amount of time used by the process or thread since
##                    its start.
##    $unit (String) The unit in which to display $total. See the definitions
##                   of `duration-unit-*`.

# Common case.
about-processes-cpu = { NUMBER($percent, maximumSignificantDigits: 2, style: "percent") }
    .title = PUZ denbora guztira: { NUMBER($total, maximumFractionDigits: 0) }{ $unit }
# Special case: data is not available yet.
about-processes-cpu-user-and-kernel-not-ready = (neurtzen)
# Special case: process or thread is currently idle.
about-processes-cpu-idle = inaktibo
    .title = PUZ denbora guztira: { NUMBER($total, maximumFractionDigits: 2) }{ $unit }

## Displaying Memory (total and delta)
## Variables:
##    $total (Number) The amount of memory currently used by the process.
##    $totalUnit (String) The unit in which to display $total. See the definitions
##                        of `memory-unit-*`.
##    $delta (Number) The absolute value of the amount of memory added recently.
##    $deltaSign (String) Either "+" if the amount of memory has increased
##                        or "-" if it has decreased.
##    $deltaUnit (String) The unit in which to display $delta. See the definitions
##                        of `memory-unit-*`.

# Common case.
about-processes-total-memory-size-changed = { NUMBER($total, maximumFractionDigits: 0) }{ $totalUnit }
    .title = Bilakaera: { $deltaSign }{ NUMBER($delta, maximumFractionDigits: 0) }{ $deltaUnit }
# Special case: no change.
about-processes-total-memory-size-no-change = { NUMBER($total, maximumFractionDigits: 0) }{ $totalUnit }

## Duration units

duration-unit-ns = ns
duration-unit-us = µs
duration-unit-ms = ms
duration-unit-s = s
duration-unit-m = m
duration-unit-h = h
duration-unit-d = e

## Memory units

memory-unit-B = B
memory-unit-KB = KB
memory-unit-MB = MB
memory-unit-GB = GB
memory-unit-TB = TB
memory-unit-PB = PB
memory-unit-EB = EB
