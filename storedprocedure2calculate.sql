CREATE OR REPLACE PROCEDURE CalculateTotalPayment(
    p_BookingID INT,
    o_TotalPayment OUT DECIMAL
) IS
    v_Price DECIMAL;
    v_Days INT;
BEGIN
    SELECT Price INTO v_Price FROM Property WHERE PropertyID = (SELECT PropertyID FROM Booking WHERE BookingID = p_BookingID);
    SELECT (CheckOutDate - CheckInDate) INTO v_Days FROM Booking WHERE BookingID = p_BookingID;
    o_TotalPayment := v_Price * v_Days;
END;
/
