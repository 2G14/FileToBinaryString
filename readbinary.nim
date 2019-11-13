import os, streams, strutils

proc readBinary(filename: string): string =
  let s = newFileStream(filename, fmRead)
  defer: s.close()
  result = ""
  while not s.atEnd:
    result.add(s.readUint8().int.toBin(8))

echo readBinary(commandLineParams()[0])
