-- ======================================
-- OLA RIDE BOOKING ANALYSIS 
-- ======================================

-- 1. Retrieve all successful bookings
SELECT *
FROM bookings_final
WHERE booking_status = 'Success';

-- 2. Average ride distance for each vehicle type
SELECT
    vehicle_type,
    AVG(ride_distance) AS avg_ride_distance
FROM bookings_final
GROUP BY vehicle_type;

-- 3. Total number of rides cancelled by customer
SELECT COUNT(*) AS customer_cancellations
FROM bookings_final
WHERE booking_status = 'Cancelled by Customer';

-- 4. Top 5 customers with highest number of rides
SELECT
    customer_id,
    COUNT(booking_id) AS total_rides
FROM bookings_final
GROUP BY customer_id
ORDER BY total_rides DESC
LIMIT 5;

-- 5. Rides cancelled by driver due to personal & car issues
SELECT COUNT(*) AS driver_cancellations_personal_car
FROM bookings_final
WHERE canceled_rides_by_driver = 'Personal & Car related issue';

-- 6. Maximum driver rating for Prime Sedan bookings
SELECT MAX(driver_ratings) AS max_driver_rating
FROM bookings_final
WHERE vehicle_type = 'Prime Sedan';
