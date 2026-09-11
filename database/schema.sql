-- PawCare prototype schema
-- Scope: pet profiles, services, bookings, booking status, payments and invoices.

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(160),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pets (
    pet_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    name VARCHAR(80) NOT NULL,
    species VARCHAR(30) NOT NULL,
    breed VARCHAR(80),
    gender VARCHAR(10),
    birth_date DATE,
    weight_kg DECIMAL(5,2),
    care_notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE services (
    service_id INTEGER PRIMARY KEY,
    service_name VARCHAR(120) NOT NULL,
    description TEXT,
    duration_minutes INTEGER NOT NULL CHECK (duration_minutes > 0),
    price_vnd INTEGER NOT NULL CHECK (price_vnd >= 0),
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE staff (
    staff_id INTEGER PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    role_name VARCHAR(80) NOT NULL,
    phone VARCHAR(20),
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE bookings (
    booking_id INTEGER PRIMARY KEY,
    booking_code VARCHAR(30) NOT NULL UNIQUE,
    customer_id INTEGER NOT NULL,
    pet_id INTEGER NOT NULL,
    staff_id INTEGER,
    scheduled_start TIMESTAMP NOT NULL,
    note TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending', 'confirmed', 'in_progress', 'completed', 'cancelled')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (pet_id) REFERENCES pets(pet_id),
    FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

CREATE TABLE booking_services (
    booking_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1 CHECK (quantity > 0),
    unit_price_vnd INTEGER NOT NULL CHECK (unit_price_vnd >= 0),
    PRIMARY KEY (booking_id, service_id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE payments (
    payment_id INTEGER PRIMARY KEY,
    booking_id INTEGER NOT NULL UNIQUE,
    amount_vnd INTEGER NOT NULL CHECK (amount_vnd >= 0),
    method VARCHAR(20) NOT NULL CHECK (method IN ('cash', 'bank_transfer', 'card')),
    status VARCHAR(20) NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending', 'paid', 'failed', 'refunded')),
    paid_at TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE TABLE invoices (
    invoice_id INTEGER PRIMARY KEY,
    invoice_code VARCHAR(30) NOT NULL UNIQUE,
    booking_id INTEGER NOT NULL UNIQUE,
    total_amount_vnd INTEGER NOT NULL CHECK (total_amount_vnd >= 0),
    issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);
