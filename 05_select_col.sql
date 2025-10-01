SELECT IdCliente,
    --QtdePontos,
    --QtdePontos + 10 AS QtdePontosplus,
    --QtdePontos * 2 AS QtdePontosDouble,
    DtCriacao,
    substr(DtCriacao, 1,10) AS dtSubstring,
    datetime(substr(DtCriacao, 1,10)) AS DtCriacaoNova,
    strftime('%w', datetime(substr(DtCriacao, 1,10))) AS DiaDaSemana

FROM clientes