(function () {
  const routes = {
    pets: '../pages/pets.html',
    services: '../pages/services.html',
    booking: '../pages/booking.html',
    appointments: '../pages/appointments.html',
    payments: '../pages/payments.html',
    careProcess: '../pages/care-process.html',
    staffManagement: '../pages/staff-management.html',
  };

  const getRoute = (name) => routes[name];

  document.querySelectorAll('[data-path]').forEach((link) => {
    const pathMap = {
      'my-pets': 'pets',
      'services': 'services',
      'booking': 'booking',
      'my-appointments': 'appointments',
      'payments-invoices': 'payments',
      'care-process': 'careProcess',
      'staff-management': 'staffManagement',
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
      const careLink = document.createElement('a');
      careLink.href = getRoute('careProcess');
      careLink.dataset.action = 'care-process';
      careLink.className = 'px-space-md py-space-sm rounded-xl bg-primary-container text-on-primary-container font-label-lg text-label-lg hover:bg-primary transition-all';
      careLink.textContent = 'Care Process';
      actionArea.appendChild(careLink);
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
