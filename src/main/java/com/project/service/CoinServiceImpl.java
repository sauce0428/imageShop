package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.ChargeCoin;
import com.project.domain.PayCoin;
import com.project.mapper.CoinMapper;

@Service
public class CoinServiceImpl implements CoinService {
	
	@Autowired
	private CoinMapper mapper;

	@Override
	public int charge(ChargeCoin chargeCoin) throws Exception {
		//1.코인 충전 내역서
		mapper.create(chargeCoin);
		//2.코인 충전 진행
		return mapper.charge(chargeCoin);
	}

	@Override
	public List<ChargeCoin> list(int userNo) throws Exception {
		return mapper.list(userNo);
	}

	@Override
	public int pay(PayCoin payCoin) throws Exception {
		return mapper.pay(payCoin);
	}

	@Override
	public int createPayHistory(PayCoin payCoin) throws Exception {
		return mapper.createPayHistory(payCoin);		
	}

	@Override
	public List<PayCoin> listPayHistory(int userNo) throws Exception {
		return mapper.listPayHistory(userNo);
	}


}
