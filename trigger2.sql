CREATE OR REPLACE TRIGGER PreventBookingOverlap
BEFORE INSERT ON Booking
FOR EACH ROW
DECLARE
    v_Count INT;
BEGIN
    SELECT COUNT(*) INTO v_Count
    FROM Booking
    WHERE PropertyID = :NEW.PropertyID
    AND CheckInDate <= :NEW.CheckOutDate
    AND CheckOutDate >= :NEW.CheckInDate;

    IF v_Count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Property is already booked for the selected dates.');
    END IF;
END;
/
