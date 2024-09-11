CREATE OR REPLACE PROCEDURE InsertBooking(
    p_NumberOfGuests INT,
    p_RoomType VARCHAR,
    p_CheckInDate DATE,
    p_CheckOutDate DATE,
    p_CustomerID INT,
    p_PropertyID INT
) IS
BEGIN
    INSERT INTO Booking (NumberOfGuests, RoomType, CheckInDate, CheckOutDate, CustomerID, PropertyID)
    VALUES (p_NumberOfGuests, p_RoomType, p_CheckInDate, p_CheckOutDate, p_CustomerID, p_PropertyID);
END;
/
