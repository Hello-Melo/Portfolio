<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	
		<footer>
			<div class="container">
				<div class="first-line pb-5 pt-5 logoname"><spring:message code="board.teak" /></div>
				<div class="second-line pb-5 pt-5">
					<div class="row" style="align-items: center; text-align: center;">
						<div class="flag col-1">
							<img src="${contextPath}/resources/imgs/logo1-removebg-preview.png" alt="" width="65" height="65" class="">
						</div>
						<div class="col-1"><spring:message code="footer.name" /></div>
						<div class="col-2">
							<span><spring:message code="footer.phone" /> <br> 010 - 0101- 0101</span>
						</div>
						<div class="col-2">
							<spring:message code="footer.com" /> <br>302-11-55148
						</div>
						<div class="col-2">
							<spring:message code="footer.callnum" /> <br> 054-444-1121
						</div>
						<div class="col">
							<a href="#"> Email Sigin-Up</a>
						</div>
						<div class="col-2">
							<a href="?lang=ko"><spring:message code="board.change" /></a> <span>|</span> <a href="?lang=en"><spring:message code="board.eng" /></a>
						</div>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>