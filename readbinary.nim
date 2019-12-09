import os, streams, strutils

proc readBinary(filename: string): string =
  let s = newFileStream(filename, fmRead)
  defer: s.close()
  result = ""
  while not s.atEnd:
    result.add(s.readUint8().int.toBin(8))

if paramCount() < 1:
  quit("filename param not found.")
let filename = commandLineParams()[0]
let binarystring = readBinary(filename)
echo binarystring
