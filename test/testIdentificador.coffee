bc = require '../src/identificador.coffee'
assert = require('chai').assert
exp = require("chai").expect

describe 'juca', ->
  it 'o arquivo com todas as musicas deve ter 52 linhas', ->
        res = bc.getQtdLinhas('/tmp/todas.m3u')
        exp(res).equal(52)
  it 'trocar espaco para underscore', ->
    exp(bc.trocarEspacoParaUnderscore 'duas palavras').equal('duas_palavras')
  it 'transformar array', ->
    ori = ['rh fan', 'rh blu']
    res = bc.transformarArray(ori)
    esp = ['mv "rh fan" 101-rh_fan', 'mv "rh blu" 102-rh_blu']
    exp(res[1]).equal(esp[1])
  it 'converter', ->
    exp(bc.converter('/tmp/todas.m3u', '/tmp/ren.sh')).equal 'fim'

deve = (num, res) ->
  assert bc.calcular(num) == res
