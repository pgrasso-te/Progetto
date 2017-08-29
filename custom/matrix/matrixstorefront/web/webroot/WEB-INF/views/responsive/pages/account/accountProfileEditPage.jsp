<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/responsive/template"%>
<%@ taglib prefix="cms" uri="http://hybris.com/tld/cmstags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="formElement"
	tagdir="/WEB-INF/tags/responsive/formElement"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>

<div class="account-section-header">
	<div class="row">
		<div class="container-lg col-md-6">
			<spring:theme code="text.account.profile.updatePersonalDetails" />
		</div>
	</div>
</div>

<div class="row">
	<div class="container-lg col-md-6">
		<div class="account-section-content">
			<div class="account-section-form">
				<form:form action="update-profile" method="post"
					commandName="matrixUpdateProfileForm">

					<formElement:formSelectBox idKey="profile.title"
						labelKey="profile.title" path="titleCode" mandatory="true"
						skipBlank="false" skipBlankMessageKey="form.select.empty"
						items="${titleData}" selectCSSClass="form-control" />
					<formElement:formInputBox idKey="profile.firstName"
						labelKey="profile.firstName" path="firstName" inputCSS="text"
						mandatory="true" />
					<formElement:formInputBox idKey="profile.lastName"
						labelKey="profile.lastName" path="lastName" inputCSS="text"
						mandatory="true" />

					<formElement:formCheckbox idKey="profile.isShadow"
						labelKey="profile.isShadow" path="isShadow" mandatory="false" />


					<formElement:formTextArea idKey="profile.note"
						labelKey="profile.note" path="note" mandatory="false"/>


					<div class="row"> 
						<div class="col-sm-6 col-sm-push-6">
							<div class="accountActions">
								<ycommerce:testId
									code="personalDetails_savePersonalDetails_button">
									<button type="submit" class="btn btn-primary btn-block">
										<spring:theme code="text.account.profile.saveUpdates"
											text="Save Updates" />
									</button>
								</ycommerce:testId>
							</div>
						</div>
						<div class="col-sm-6 col-sm-pull-6">
							<div class="accountActions">
								<ycommerce:testId
									code="personalDetails_cancelPersonalDetails_button">
									<button type="button"
										class="btn btn-default btn-block backToHome">
										<spring:theme code="text.account.profile.cancel" text="Cancel" />
									</button>
								</ycommerce:testId>
							</div>
						</div>
					</div>
				</form:form>
			</div>
		</div>

	</div>
</div>
<div class="account-section-header ${noBorder}">
	<spring:theme code="text.account.profile.updatePersonalNotes" />

	<ycommerce:testId code="addressBook_addNewAddress_button">
		<div class="account-section-header-add pull-right">
			<a href="add-address"> <spring:theme
					code="text.account.addressBook.addAddress" />
			</a>
		</div>
	</ycommerce:testId>

</div><%-- 
<div class="row" style="margin-bottom: 3%">
	<div class="account-section-header">
		<div class="row">
			<div class="container-lg col-md-6">
				<spring:theme code="text.account.profile.updatePersonalNotes" />

			</div>
		</div>
	</div>


</div>
--%>
<%--<div class="row"style="padding-top:2%"> --%>
<div class="row" style="margin-bottom: 3%">

	<div>
		<ul style="padding-bottom: 5%;">
			<c:forEach var="comment" items="${comments}">
				<li><p>${comment.description}</p></li>
			</c:forEach>
		</ul>
	</div>
</div>


<div class="account-section-header ${noBorder}">
	<spring:theme code="text.account.addressBook" />

	<ycommerce:testId code="addressBook_addNewAddress_button">
		<div class="account-section-header-add pull-right">
			<a href="add-address"> <spring:theme
					code="text.account.addressBook.addAddress" />
			</a>
		</div>
	</ycommerce:testId>

</div>


<%---agg --%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ycommerce" uri="http://hybris.com/tld/ycommercetags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:htmlEscape defaultHtmlEscape="true" />
<div class="account-addressbook account-list">
	<c:if test="${empty addressData}">
		<div class="account-section-content content-empty">
			<spring:theme code="text.account.addressBook.noSavedAddresses" />
		</div>
	</c:if>

	<c:if test="${not empty addressData}">
		<div class="account-cards card-select">
			<div class="row">
				<c:forEach items="${addressData}" var="address">
					<div class="col-xs-12 col-sm-6 col-md-4 card">
						<ul class="pull-left">
							<li><strong>${fn:escapeXml(address.title)}&nbsp;${fn:escapeXml(address.firstName)}&nbsp;${fn:escapeXml(address.lastName)}
									<c:if test="${address.defaultAddress}">
										(<spring:theme code="text.default" />)
									</c:if>
							</strong></li>
							<li>${fn:escapeXml(address.line1)}</li>
							<c:if test="${not empty fn:escapeXml(address.line2)}">
								<li>${fn:escapeXml(address.line2)}</li>
							</c:if>
							<li>${fn:escapeXml(address.town)}&nbsp;${fn:escapeXml(address.region.name)}</li>
							<li>
								${fn:escapeXml(address.country.name)}&nbsp;${fn:escapeXml(address.postalCode)}</li>
							<li>${fn:escapeXml(address.phone)}</li>
						</ul>

						<c:if test="${not address.defaultAddress}">
							<ycommerce:testId code="addressBook_isDefault_button">
								<a class="account-set-default-address"
									href="set-default-address/${fn:escapeXml(address.id)}"> <spring:theme
										code="text.setDefault" />
								</a>
							</ycommerce:testId>
						</c:if>
						<div class="account-cards-actions pull-left">
							<ycommerce:testId code="addressBook_editAddress_button">
								<a class="action-links"
									href="edit-address/${fn:escapeXml(address.id)}"> <span
									class="glyphicon glyphicon-pencil"></span>
								</a>
							</ycommerce:testId>
							<ycommerce:testId code="addressBook_removeAddress_button">
								<a href="#" class="action-links removeAddressFromBookButton"
									data-address-id="${fn:escapeXml(address.id)}"
									data-popup-title="<spring:theme code="text.address.delete.popup.title" />">
									<span class="glyphicon glyphicon-remove"></span>
								</a>
							</ycommerce:testId>
						</div>
					</div>

				</c:forEach>
			</div>
			<c:forEach items="${addressData}" var="address">
				<div class="display-none">
					<div id="popup_confirm_address_removal_${fn:escapeXml(address.id)}"
						class="account-address-removal-popup">
						<div class="addressItem">
							<spring:theme code="text.address.remove.following" />

							<div class="address">
								<strong> ${fn:escapeXml(address.title)}&nbsp;
									${fn:escapeXml(address.firstName)}&nbsp;
									${fn:escapeXml(address.lastName)} </strong> <br>
								${fn:escapeXml(address.line1)}&nbsp;
								${fn:escapeXml(address.line2)} <br>
								${fn:escapeXml(address.town)}&nbsp;
								<c:if test="${not empty address.region.name }">
						            ${fn:escapeXml(address.region.name)}&nbsp;
						        </c:if>
								<br> ${fn:escapeXml(address.country.name)}&nbsp;
								${fn:escapeXml(address.postalCode)} <br />


								${fn:escapeXml(address.phone)}
							</div>

							<div class="modal-actions">
								<div class="row">
									<ycommerce:testId code="addressRemove_delete_button">
										<div class="col-xs-12 col-sm-6 col-sm-push-6">
											<a class="btn btn-primary btn-block"
												data-address-id="${fn:escapeXml(address.id)}"
												href="remove-address/${fn:escapeXml(address.id)}"> <spring:theme
													code="text.address.delete" />
											</a>
										</div>
									</ycommerce:testId>
									<div class="col-xs-12 col-sm-6 col-sm-pull-6">
										<a class="btn btn-default btn-block closeColorBox"
											data-address-id="${fn:escapeXml(address.id)}"> <spring:theme
												code="text.button.cancel" />
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>