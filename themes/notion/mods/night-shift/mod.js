/*
 * night shift
 * (c) 2020 dragonwocky <thedragonring.bod@gmail.com> (https://dragonwocky.me/)
 * under the MIT license
 */

'use strict';

module.exports = {
  id: '9a71bbff-e87d-4a0b-8a2c-a93473113c30',
  tags: ['extension', 'theme'],
  name: 'night shift',
  desc:
    'sync dark/light theme with the system (overrides normal theme setting).',
  version: '0.1.2',
  author: 'dragonwocky',
  hacks: {
    'renderer/preload.js'(store, __exports) {
      document.addEventListener('readystatechange', (event) => {
        if (document.readyState !== 'complete') return false;
        const attempt_interval = setInterval(enhance, 500);
        function enhance() {
          const notion_elem = document.querySelector('.notion-app-inner');
          if (!notion_elem) return;
          clearInterval(attempt_interval);
          handle([{ target: notion_elem }]);
          const observer = new MutationObserver(handle);
          observer.observe(notion_elem, {
            attributes: true,
            subtree: true,
          });
          function handle(list, observer) {
            const mode = `notion-app-inner notion-${
              window.matchMedia('(prefers-color-scheme: dark)').matches
                ? 'dark'
                : 'light'
            }-theme`;
            if (notion_elem.className !== mode) notion_elem.className = mode;
            window
              .matchMedia('(prefers-color-scheme: dark)')
              .addEventListener('change', handle);
          }
        }
      });
    },
  },
};
