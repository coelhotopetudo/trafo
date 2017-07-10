bc = module.exports = () ->

bc.converter = (ori, des) ->
  linhas = descartarUltima(ori)
  res = bc.transformarArray(linhas)
  str = res.toString().replace(/,/g, '\n')
  fs = require 'fs'
  fs.writeFile des, res

bc.trocarEspacoParaUnderscore = (str) ->
  res = str.replace(' ', '_')
  res

bc.transformarArray = (arr) ->
  res = []
  num = 101
  arr = while num++ <= (arr.length + 100)
    pos = num - 2
    ori = arr[pos-100]
    und = ori.replace(/\ /g, '_')
    str = "mv \"#{ori}\" \"#{num-1}-#{und}\""
    res.push(str)
  res

bc.getQtdLinhas = (num) ->
  count = 0;
  linhas = descartarUltima(num)
  count = linhas.length
  return count

abrir = (num) ->
  fs = require 'fs'
  fs.readFileSync num, 'utf8'

descartarUltima = (num) ->
  todas = abrir(num)
  comUltima = todas.split('\n')
  comUltima[0..(comUltima.length-2)]

bc.show = (msg) ->
  console.log(msg)


