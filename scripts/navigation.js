(function () {
  const routes = {
    pets: '../pages/pets.html',
    services: '../pages/services.html',
    booking: '../pages/booking.html',
    appointments: '../pages/appointments.html',
    payments: '../pages/payments.html',
  };

  const getRoute = (name) => routes[name];

  document.querySelectorAll('[data-path]').forEach((link) => {
    const pathMap = {
      'my-pets': 'pets',
      'services': 'services',
      'booking': 'booking',
      'my-appointments': 'appointments',
      'payments-invoices': 'payments',
    };
    link.setAttribute('href', getRoute(pathMap[link.dataset.path]));
  });

  const logoLink = document.querySelector('header a[href="#"]');
  if (logoLink) logoLink.setAttribute('href', getRoute('pets'));

  document.querySelectorAll('button').forEach((button) => {
    const label = button.textContent.replace(/\s+/g, ' ').trim();
    if (label.includes('Book now') || label.includes('Confirm booking')) {
      button.addEventListener('click', () => {
        window.location.href = getRoute(label.includes('Confirm') ? 'appointments' : 'booking');
      });
    }
  });

  const ongoingAppointment = document.querySelector('.appointment-card[data-status="ongoing"]');
  if (ongoingAppointment) {
    const actionArea = ongoingAppointment.querySelector('.self-end, .sm\\:self-auto');
    if (actionArea && !actionArea.querySelector('[data-action="payment"]')) {
      const paymentLink = document.createElement('a');
      paymentLink.href = getRoute('payments');
      paymentLink.dataset.action = 'payment';
      paymentLink.className = 'px-space-md py-space-sm rounded-xl bg-primary text-on-primary font-label-lg text-label-lg hover:bg-primary-container transition-all';
      paymentLink.textContent = 'Payment';
      actionArea.appendChild(paymentLink);
    }
  }

  const completedInvoiceLink = document.querySelector('.appointment-card[data-status="completed"] a[href="#"]');
  if (completedInvoiceLink) {
    completedInvoiceLink.href = `${getRoute('payments')}#invoice-HD-20241020`;
  }

  if (window.location.hash === '#invoice-HD-20241020' && typeof window.openInvoiceModal === 'function') {
    window.openInvoiceModal('HD-20241020', '200,000 VND', 'Paid', 'Bank transfer (VietQR)', '20/10/2024', 'Routine wellness check & deworming');
  }
})();
