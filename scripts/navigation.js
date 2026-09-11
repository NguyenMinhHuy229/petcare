(function () {
  const routes = {
    pets: '../qu_n_l_th_c_ng/code.html',
    services: '../d_ch_v/code.html',
    booking: '../t_l_ch/code.html',
    appointments: '../l_ch_h_n_c_a_t_i/code.html',
    payments: '../thanh_to_n_h_a_n/code.html',
  };

  const getRoute = (name) => routes[name];

  document.querySelectorAll('[data-path]').forEach((link) => {
    const pathMap = {
      'thu-cung-cua-toi': 'pets',
      'dich-vu': 'services',
      'dat-lich': 'booking',
      'lich-hen-cua-toi': 'appointments',
      'thanh-toan-va-hoa-don': 'payments',
    };
    link.setAttribute('href', getRoute(pathMap[link.dataset.path]));
  });

  const logoLink = document.querySelector('header a[href="#"]');
  if (logoLink) logoLink.setAttribute('href', getRoute('pets'));

  document.querySelectorAll('button').forEach((button) => {
    const label = button.textContent.replace(/\s+/g, ' ').trim();
    if (label.includes('Đặt lịch ngay') || label.includes('Xác nhận đặt lịch')) {
      button.addEventListener('click', () => {
        window.location.href = getRoute(label.includes('Xác nhận') ? 'appointments' : 'booking');
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
      paymentLink.textContent = 'Thanh toán';
      actionArea.appendChild(paymentLink);
    }
  }

  const completedInvoiceLink = document.querySelector('.appointment-card[data-status="completed"] a[href="#"]');
  if (completedInvoiceLink) {
    completedInvoiceLink.href = `${getRoute('payments')}#invoice-HD-20241020`;
  }

  if (window.location.hash === '#invoice-HD-20241020' && typeof window.openInvoiceModal === 'function') {
    window.openInvoiceModal('HD-20241020', '200.000 đ', 'Đã thanh toán', 'Chuyển khoản (VietQR)', '20/10/2024', 'Khám sức khỏe tổng quát định kỳ & Sổ giun đa liều');
  }
})();
