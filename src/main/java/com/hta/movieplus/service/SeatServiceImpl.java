package com.hta.movieplus.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class SeatServiceImpl implements SeatService {

	private static final Logger logger = LoggerFactory.getLogger(SeatServiceImpl.class);

	public static String[] alps = { "A", "B", "C", "D", "E", "D", "F", "G", "H", "J", "K", "L", "M" };

	@Override
	public int getSeatCount(String seatStr) {
		// TODO Auto-generated method stub
		List<Integer> indexList = getIndexList(seatStr);

		int x = getX(indexList, seatStr);
		int y = getY(seatStr);

		return x * y - (indexList.size() - 1);
	}

	@Override
	public String makeSeatStr(String seatStr) {
		// TODO Auto-generated method stub
		
		int blockLength = 0;
		int blockIndex = 1;

		// 임시 예매된 좌석 리스트
		List<String> bookedSeatListTemp = new ArrayList<String>();
		bookedSeatListTemp.add("K13");
		bookedSeatListTemp.add("B2");
		bookedSeatListTemp.add("A7");
		bookedSeatListTemp.add("C20");
		bookedSeatListTemp.add("E11");
		bookedSeatListTemp.add("G19");
		bookedSeatListTemp.add("E10");
		bookedSeatListTemp.add("A3");
		bookedSeatListTemp.add("G10");
		bookedSeatListTemp.add("H10");
		bookedSeatListTemp.add("J9");
		bookedSeatListTemp.add("J10");
		bookedSeatListTemp.add("J11");
		

		// 임시 예매된 좌석 리스트

		int column_y_position = 52;
		int seat_x_position = 181;
		int seat_y_position = 50;

		int alpIndex = -1;
		int seatIndex = -1;

		List<Integer> indexList = getIndexList(seatStr);
		List<String> deletedSeatList = new ArrayList<String>();

		for (int i = 0; i < indexList.size(); i++) {
			if (i == indexList.size() - 1) {
				deletedSeatList.add(seatStr.substring(indexList.get(i), seatStr.length()));
				break;
			}
			deletedSeatList.add(seatStr.substring(indexList.get(i), indexList.get(i + 1)));

		}

		List<String> disabledSeatList = new ArrayList<String>();
		disabledSeatList.addAll(deletedSeatList);
		disabledSeatList.addAll(bookedSeatListTemp);

		Collections.sort(disabledSeatList, new CustomComparator());

		StringBuilder sb = new StringBuilder();

		int x = getX(indexList, seatStr);
		int y = getY(seatStr);

		logger.info(disabledSeatList.toString());

		// x가 작을수록 seatxposition이 커져야함
		// 20개일때 161, 8개일때 251 / 90

		for (int i = 0; i < y; i++) {
			blockIndex = 1;
			List<Integer> disableX = getDisableXList(i, disabledSeatList);
			
			seat_x_position = (int) (181 + (7.5 * (20 - x)));
			sb.append(
					"<button type='button' class='btn-seat-row' title='A 행' style='position: absolute; left: 106px; top: "
							+ column_y_position + "px;'>" + alps[i] + "</button>");

			for (int j = 1; j <= x; j++) {
				
				blockLength = getBlockLength(x, j, disableX); // 블록 길이 구하는 메서드
				
				
				if (checkAvailableSeat(j, i, deletedSeatList)) { // 생성 시 지운 블럭 체크
					seat_x_position += 20;
					blockIndex = 1;
					continue;
				}

				if (checkAvailableSeat(j, i, bookedSeatListTemp)) { // 예매되어있는 블럭 체크
					sb.append("<button type='button' title='" + alps[i] + j + " (스탠다드/장애인석)' data-seat-num='" + alps[i] + j
							+ "' selectionType='booked' "
							+ "class='jq-tooltip seat-condition standard finish' style='position: absolute; left: "
							+ seat_x_position + "px; top: " + seat_y_position + "px; width: 20px;'>\r\n"
							+ "<span class='num'>" + j
							+ "</span><span class='kind'>스탠다드</span><span class='condition'>판매가능</span><span class='rank'>장애인석</span>");
					seat_x_position += 20;
					blockIndex = 1;
					continue;

				}
				sb.append("<button type='button' title='" + alps[i] + j + " (스탠다드/장애인석)' data-seat-num='" + alps[i] + j
						+ "' selectionType='" + getSelectionType(blockIndex, blockLength) + "' blockIndex='"+blockIndex+"' blockLength='"+blockLength+"'" 
						+ " class='jq-tooltip seat-condition standard common' style='position: absolute; left: "
						+ seat_x_position + "px; top: " + seat_y_position + "px; width: 20px;'>\r\n"
						+ "<span class='num'>" + j
						+ "</span><span class='kind'>스탠다드</span><span class='condition'>판매가능</span><span class='rank'>장애인석</span>");
				seat_x_position += 20;
				blockIndex++;
//				selectionChk = !selectionChk;
			}
			seat_y_position += 20;
			column_y_position += 20;
		}

		return sb.toString();
	}

	private int getBlockLength(int xLength, int x, List<Integer> disableX) {
		for(int i=0;i<disableX.size();i++) {
			
			if(i==disableX.size()-1) {
				return xLength - disableX.get(disableX.size()-1);
			}
			
			if(x < disableX.get(i) && i==0) {
				return disableX.get(i) - 1;
			}
			
			if(x > disableX.get(i) && x < disableX.get(i+1)) {
				return disableX.get(i+1) - disableX.get(i) - 1;
			}
			
		}

		
		return 0;
	}

	private List<Integer> getDisableXList(int y, List<String> disabledSeatList) {
		// TODO Auto-generated method stub
		
		return disabledSeatList.stream()
				.filter(x -> x.substring(0,1).equals(alps[y]))
				.map(x -> Integer.parseInt(x.substring(1)))
				.collect(Collectors.toList());
	}

	public int getAlpIndex(String alpInput) {

		for (int i = 0; i < alps.length; i++) {
			if (alps[i].equals(alpInput)) {
				return i + 1;
			}
		}

		return 0;
	}

	public int getY(String input) {
		return getAlpIndex(input.substring(0, 1));
	}

	public int getX(List<Integer> indexList, String input) {

		int result = 0;

		if (indexList.size() == 1) {
			result = Integer.parseInt(input.substring(1, input.length()));
		} else {
			result = Integer.parseInt(input.substring(1, indexList.get(1)));
		}

		return result;
	}

	public List<Integer> getIndexList(String seatStr) {
		String pattern = "^[A-Z]$";
		String splits[] = seatStr.split("");

		List<Integer> indexList = new ArrayList<Integer>();

		for (int i = 0; i < splits.length; i++) {
			if (splits[i].matches(pattern)) {
				indexList.add(i);
			}
		}

		return indexList;
	}

	public boolean checkAvailableSeat(int x, int y, List<String> seatList) {
		StringBuilder sb2 = new StringBuilder();
		sb2.append(alps[y]);
		sb2.append(x);

		for (String seat : seatList) {
			if (seat.equals(sb2.toString())) {
				return true;
			}

		}

		return false;
	}
	
	public String getSelectionType(int index, int length) {
		if(length <= 2) {
			return "normal";
		}
		
		if(length % 2 == 1) { // 홀수일때
			if((length - index) % 2 == 1) {
				return "non-solo";
			}
			else {
				return "normal";	
			}
			
		}else { // 짝수일때 
			if((length - index) == 0) {
				return "normal";
			}
			if((length - index) == 1) {
				return "non-solo";
			}
			
			if((length - index) % 2 == 0) {
				return "non-solo";
			}
			else {
				return "normal";	
			}
		}
	}

	private static class CustomComparator implements Comparator<String> {

		@Override
		public int compare(String s1, String s2) {
			// 첫 번째 우선 순위는 A~M의 알파벳 순서입니다.
			int firstPriority = s1.substring(0, 1).compareTo(s2.substring(0, 1));

			// 만약 알파벳이 같다면, 두 번째 우선 순위는 숫자입니다.
			if (firstPriority == 0) {
				int num1 = Integer.parseInt(s1.substring(1));
				int num2 = Integer.parseInt(s2.substring(1));
				return num1 - num2;
			}

			return firstPriority;
		}
	}

}
